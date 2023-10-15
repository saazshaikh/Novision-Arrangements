//
//  SubjectListView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct SubjectListView: View {
    
    @ObservedObject var novisionManager: NovisionManager
    @State private var isNewSheetPresented = false
    @State private var showConfirmAlert = false
    
    var body: some View {
        NavigationStack {
            List ($novisionManager.eachFlashcardInfoSamples, editActions: [.all]) { $eachFlashcardInfoSample in
                //to enable both the rearrage and delete option, we have used 'editActions: [.all]'
                
                FlashcardLayoutFromSubjectToTopicWithLinksView(eachflashcardinfo: $eachFlashcardInfoSample.topics)
                
            }
            .navigationTitle("Subjects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "clipboard")
                    }
                    
                    Button {
                        isNewSheetPresented = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
                
            }.sheet(isPresented: $isNewSheetPresented) {
                NewSubjectView(sourceFlashcards: $novisionManager.eachFlashcardInfoSamples)
            }
            
        }

    }
}

struct SubjectListView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectListView(novisionManager: NovisionManager())
    }
}

//
//  TopicListView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct TopicListView: View {
    @ObservedObject var novisionManager: NovisionManager
    
    @State private var showConfirmAlert = false
    @State private var isNewSheetPresented = false
    var body: some View {
        
        NavigationStack {
            List($novisionManager.eachFlashcardInfoSamples, editActions: [.all]) {$flashcard in
                FlashcardLayoutFromTopicToQandAWithLinksView(eachflashcardinfo: $flashcard)
            }
            .navigationTitle("Topics")
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
                
            }
            .sheet(isPresented: $isNewSheetPresented) {
                NewTopicView(sourceFlashcards: $novisionManager.eachFlashcardInfoSamples)
                // this makes the sheet medium sized
            }
            .alert(isPresented: $showConfirmAlert) {
                Alert(
                    title: Text("Load Sample Data?"),
                    message: Text("Warning: All existing data will be deleted"),
                    primaryButton: .destructive(Text("Replace")) {
                        novisionManager.loadSampleData()
                    },
                    secondaryButton: .cancel()
                )
            }
            
        }
        
    }
}

struct TopicListView_Previews: PreviewProvider {
    static var previews: some View {
        TopicListView(novisionManager: NovisionManager())
    }
}

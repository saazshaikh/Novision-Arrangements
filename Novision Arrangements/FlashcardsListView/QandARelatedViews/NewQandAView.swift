//
//  NewQandAView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct NewQandAView: View {
    
    @State private var newQuestion = ""
    @State private var newAnswer = ""
    @State private var showAlert1 = false
    @State private var showAlert2 = false
    
    @Binding var sourceFlashcards: [EachFlashcardInfo]
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        Form{
            Section ("info") {
                TextField("Question", text: $newQuestion)
                TextField("Answer", text: $newAnswer)
            }
            
            Section("action"){
                
                Button("Save"){
                    
                    if newQuestion != ""{
                        if newAnswer != ""{
                            let QandAs = EachFlashcardInfo(subjectName: "", topic: "", question: newQuestion, answer: newAnswer)
                            sourceFlashcards.append(QandAs)
                            dismiss()
                        } else {
                            showAlert2 = true
                        }
                    } else {
                        showAlert1 = true
                    }
                    
                }
                
                Button("Cancel", role: .destructive){
                   dismiss()
                }
                
            }
        }.alert(isPresented: $showAlert1){
            Alert(
                title: Text("Please write a question"),
                dismissButton: .default(Text("OK"))
            )
        }
        .alert(isPresented: $showAlert2){
            Alert(
                title: Text("Don't forget to write an answer! ;)")
            )
        }
    }
}

struct NewQandAView_Previews: PreviewProvider {
    static var previews: some View {
        NewQandAView(sourceFlashcards: .constant([]))
    }
}

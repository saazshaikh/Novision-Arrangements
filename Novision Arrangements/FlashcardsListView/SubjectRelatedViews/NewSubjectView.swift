//
//  NewSubjectView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct NewSubjectView: View {
    
    @State private var newSubject = ""
    @State private var newTopic = ""
    @State private var newQuestion = ""
    @State private var newAnswer = ""
    @State private var showAlert = false
    
    @Binding var sourceFlashcards: [EachFlashcardInfo]
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        Form{
            Section ("info") {
                TextField("Subject", text: $newSubject)
                TextField("Topic", text: $newTopic)
            }
            
            Section ("flashcard") {
                TextField("First Question", text: $newQuestion)
                TextField("Answer", text: $newAnswer)
            }
            
            Section("action"){
                
                Button("Save"){
                    
                    if !newSubject.isEmpty {
                        if !newTopic.isEmpty {
                            if !newQuestion.isEmpty {
                                if !newAnswer.isEmpty {
                                    let newSubjects = EachFlashcardInfo(subjectName: newSubject, topics: [
                                        Topic(title: newTopic, questions: [
                                            Question(stem: newQuestion, answer: [newAnswer]),
                                        ]),
                                    ]);//Error here: 'nil' is not compatible with expected argument type 'String'
                                    sourceFlashcards.append(newSubjects)
                                    dismiss()
                                }else {
                                    showAlert = true
                                }
                            }else {
                                showAlert = true
                            }
                        }else {
                            showAlert = true
                        }
                    } else {
                        showAlert = true
                    }
                    
                }
                
                Button("Cancel", role: .destructive){
                   dismiss()
                }
                
            }
        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text("Looks like you forgot something--"),
                message: Text("You must fill in all the info!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct NewSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewSubjectView(sourceFlashcards: .constant([]))
    }
}

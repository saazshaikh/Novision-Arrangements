//
//  NewTopicView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct NewTopicView: View {
    
    @State private var newTopic = ""
    @State private var newQuestion = ""
    @State private var newAnswer = ""
    @State private var showAlert = false
    
    @Binding var sourceFlashcards: [EachFlashcardInfo]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Info")) {
                TextField("Topic", text: $newTopic)
            }
            
            Section(header: Text("Flashcard")) {
                TextField("Question", text: $newQuestion)
                TextField("Answer", text: $newAnswer)
            }
            
            Section(header: Text("Action")) {
                Button("Save") {
                    if !newTopic.isEmpty {
                        let newTopics = EachFlashcardInfo(subjectName: "YourSubjectName", topics: [
                            Topic(title: newTopic, questions: [
                                Question(stem: newQuestion, answer: [newAnswer])
                            ])
                        ])
                        sourceFlashcards.append(newTopics)
                        dismiss()
                    } else {
                        showAlert = true
                    }
                }
                
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Looks like you forgot something"),
                message: Text("You must have a title for the new topic"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct NewTopicView_Previews: PreviewProvider {
    static var previews: some View {
        NewTopicView(sourceFlashcards: .constant([]))
    }
}

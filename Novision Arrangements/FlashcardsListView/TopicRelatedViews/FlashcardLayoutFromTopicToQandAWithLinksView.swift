//
//  FlashcardLayoutFromTopicToQandAWithLinksView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct FlashcardLayoutFromTopicToQandAWithLinksView: View {
    
    @Binding var eachflashcardinfo: EachFlashcardInfo
    @Binding var topic: Topic
    
    var body: some View {
        NavigationLink {
            QandAListView(novisionManager: NovisionManager())
        } label: {
            ZStack (alignment: .leading){
                if topic.title != "" {
                    Text(topic.title)
                }
            }
        }
    }
}

struct FlashcardLayoutFromTopicToQandAWithLinksView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardLayoutFromTopicToQandAWithLinksView(eachflashcardinfo: Topic(title: "Macbeth", questions: [
            Question(stem: "What is the theme of Macbeth?", answer: ["Ambition"]),
            Question(stem: "Who is the main character?", answer: ["Macbeth"])
        ]),
                                                     topic: Topic(title: "Macbeth", questions: [
                                                        Question(stem: "What is the theme of Macbeth?", answer: ["Ambition"]),
                                                        Question(stem: "Who is the main character?", answer: ["Macbeth"])
                                                     ])
        )
    }
}

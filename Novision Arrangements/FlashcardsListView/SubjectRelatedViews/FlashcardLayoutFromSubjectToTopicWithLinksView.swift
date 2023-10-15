//
//  FlashcardLayoutFromSubjectToTopicWithLinksView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

import SwiftUI

struct FlashcardLayoutFromSubjectToTopicWithLinksView: View {
    
    @Binding var eachflashcardinfo: EachFlashcardInfo
    
    var body: some View {
        NavigationLink {
            TopicListView(novisionManager: NovisionManager())
        } label: {
            ZStack (alignment: .leading){
                Text(eachflashcardinfo.subjectName)
                    .bold()
            }
        }
    }
}

struct FlashcardLayoutFromSubjectToTopicWithLinksView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardLayoutFromSubjectToTopicWithLinksView(eachflashcardinfo:.constant(EachFlashcardInfo(subjectName: "English", topics: [
            Topic(title: "Macbeth", questions: [
                Question(stem: "What is the theme of Macbeth?", answer: ["Ambition"]),
                Question(stem: "Who is the main character?", answer: ["Macbeth"])
            ]),
        ])))
    }
}

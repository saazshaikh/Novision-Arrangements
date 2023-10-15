//
//  FlashcardLayoutFromQandAToQandADetailWithLinksView.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import SwiftUI

struct FlashcardLayoutFromQandAToQandADetailWithLinksView: View {
    
    @Binding var eachflashcardinfo: EachFlashcardInfo
    
    var body: some View {
        NavigationLink {
            QandADetailView(novisionManager: NovisionManager())
        } label: {
            ZStack (alignment: .leading){
                VStack (alignment: .leading){
                    if eachflashcardinfo.questions != "" {
                        Text(eachflashcardinfo.question)
                            .font(.system(size: 18))
                    }
                    if eachflashcardinfo.answer != ""{
                        Text(eachflashcardinfo.answer)
                            .font(.system(size:15))
                    }
                }
            }
        }
    }
}

struct FlashcardLayoutFromQandAToQandADetailWithLinksView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardLayoutFromQandAToQandADetailWithLinksView(eachflashcardinfo:.constant(EachFlashcardInfo(subjectName: "English", topics: [
            Topic(title: "Macbeth", questions: [
                Question(stem: "What is the theme of Macbeth?", answer: ["Ambition"]),
                Question(stem: "Who is the main character?", answer: ["Macbeth"])
            ]),
        ])))
    }
}

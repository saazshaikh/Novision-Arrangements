//
//  FlashcardsExamples.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import Foundation
extension EachFlashcardInfo {
    static let FlashcardsExamples =  [
        
        EachFlashcardInfo(subjectName: "English", topics: [
            Topic(title: "Macbeth", questions: [
                Question(stem: "What is the theme of Macbeth?", answer: ["Ambition"]),
                Question(stem: "Who is the main character?", answer: ["Macbeth"])
            ]),
            Topic(title: "OMAM", questions: [
                Question(stem: "Who wrote Of Mice and Men?", answer: ["John Steinbeck"]),
                Question(stem: "What is the setting of the story?", answer: ["Salinas Valley, California"])
            ])
        ]),
        
        
        EachFlashcardInfo(subjectName: "Maths", topics:[
            Topic(title: "Algebra", questions: [
                Question(stem: "what is a in a+1 = 5", answer: ["4"]),
                Question(stem: "what is a in a+5 = 9", answer: ["4"]),
            ]),
            Topic(title: "Probability", questions: [
                Question(stem: "if the chance of getting a blue is 0.4, and red is the only colour, what is the chance of getting a red", answer: ["0.6"]),
                Question(stem: "if the chance of getting a blue is 0.7, and red is the only colour, what is the chance of getting a red", answer: ["0.3"]),
            ])
        ]),
        
    ]
}


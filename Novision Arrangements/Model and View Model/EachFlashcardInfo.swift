//
//  EachFlashcardInfo.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import Foundation

struct EachFlashcardInfo: Identifiable, Codable {
    //codable just means the stuff in the view is encodable and decodable, this also means that the stuff in this view exits int the device's memory. allows things to be written to disk and being read from disk
    var id = UUID()
    var subjectName: String
    var topics: [Topic]
}


struct Topic: Identifiable, Codable {
    var id = UUID()
    var title: String
    var questions : [Question]
}
struct Question: Identifiable, Codable {
    var id = UUID()
    var stem: String
    var answer : [String]
}

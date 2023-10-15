//
//  Novision Manager.swift
//  Novision Arrangements
//
//  Created by Saaz Shaikh on 15/10/2023.
//

import Foundation
import SwiftUI
class NovisionManager: ObservableObject {
    @Published var eachFlashcardInfoSamples: [EachFlashcardInfo] = [] {
        didSet {
        // what "didSet" does is that when todos is changed-- it saves the changes
            save()
        }
    }
        
    init() {
        load()
    }
    
    func loadSampleData() {
        eachFlashcardInfoSamples = EachFlashcardInfo.FlashcardsExamples
    }
    
    func getArchiveURL() -> URL {
        let plistName = "flashcards.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFlashcards = try? propertyListEncoder.encode(eachFlashcardInfoSamples)
        try? encodedFlashcards?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let flashcardsDecoded = try? propertyListDecoder.decode([EachFlashcardInfo].self, from: retrievedTodoData) {
            eachFlashcardInfoSamples = flashcardsDecoded
        }
    }
}

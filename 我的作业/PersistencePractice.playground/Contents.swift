//: Playground - noun: a place where people can play

import UIKit

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}


let note1 = Note(title: "Note One", text: "This is a sample note.", timestamp: Date())
let note2 = Note(title: "Note Two", text: "This is another sample note.", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())
let newNote = [note1, note2, note3]


//let newNote = Note(title: "Gocery run", text: "Pick up maynonnaise,mustard,lettuce,tomato,and pickles.", timestamp: Date())

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodeNote = try? propertyListEncoder.encode(newNote)

try? encodeNote?.write(to: archiveURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrieveNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? propertyListDecoder.decode(Array<Note>.self, from: retrieveNoteData) {
    print(decodedNote)
//    print(retrieveNoteData)
}


//let propertyListEncoder = PropertyListEncoder()
//if let encodeNote = try? propertyListEncoder.encode(newNote) {
//    print(encodeNote)
//
//let propertyListDecoder = PropertyListDecoder()
//if let decodeNote = try? propertyListDecoder.decode(Note.self, from: encodeNote) {
//    print(decodeNote)
//    }


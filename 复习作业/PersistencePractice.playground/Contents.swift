import UIKit

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
    
}

//let newNote = Note(title: "Gocery run", text: "Pick up maynonnaise,mustard,lettuce,tomato,and pickles.",timestamp: Data())
let note1 = Note(title: "Note One", text: "This is a sample note.", timestamp: Date())
let note2 = Note(title: "Note Two", text: "This is another sample note.", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())
let newNote = [note1, note2, note3]

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURl = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(newNote)
let encodedNoteData = try? encodedNote?.write(to: archiveURl, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
    if let retrievedNoteData = try? Data(contentsOf: archiveURl),
        let decodedNote = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNoteData) {
        print(decodedNote)
}





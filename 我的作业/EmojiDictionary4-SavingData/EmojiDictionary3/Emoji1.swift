//
//  Emoji.swift
//  EmojiDictionary3
//
//  Created by Johnny_L on 2017/9/25.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import Foundation

//1.建立Emoji模型并且初始化------------------------------------------
class Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    
    static func loadFromFile() -> [Emoji]? {
        guard let codeEmojis = try? Data(contentsOf: ArchiveURL) else
        { return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Emoji>.self, from: codeEmojis)
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        return [Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
                Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
                Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
                Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
                Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
                Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
                Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
                Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
                Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
                Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
                Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
                Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
                Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black and white checkered flag.", usage: "completion")]
    }
    
    static func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        let codedEmojis = try? encoder.encode(emojis)
        try? codedEmojis?.write(to: ArchiveURL, options: .noFileProtection)
        
    }
}



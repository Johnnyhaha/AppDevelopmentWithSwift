import Foundation

struct Emoji: Codable {
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
    
//    设置文件目录，存档路径
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    
//    设置编码写入档案方法
    static func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        let codedEmojis = try? encoder.encode(emojis)
        try? codedEmojis?.write(to: ArchiveURL, options: .noFileProtection)
    }
//    设置读取解码档案方法
    static func loadFromFile() -> [Emoji]? {
        guard let retrievedEmojis = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Emoji>.self, from: retrievedEmojis)
        
    }
//    设置加载的Emoji例子
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
    
}

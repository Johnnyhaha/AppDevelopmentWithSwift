import Foundation

struct StoreItem: Codable {
    var name: String
    var artist: String
    var description: String
    var kind: String
    var artworkURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case kind = "kind"
        case description = "description"
        case artworkURL = "artworkUrl100"
    }
    
    enum AddtionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        artist = try values.decode(String.self, forKey: CodingKeys.artist)
        kind = try values.decode(String.self, forKey: CodingKeys.kind)
        artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)
        
        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let addtionalValues = try decoder.container(keyedBy: AddtionalKeys.self)
            description = (try? addtionalValues.decode(String.self, forKey: AddtionalKeys.longDescription)) ?? ""
        }
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
    
}

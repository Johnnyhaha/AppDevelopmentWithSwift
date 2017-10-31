//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap{ URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}

func fetchPhotoInfo(completion: @escaping(PhotoInfo?) -> Void) {
    //let baseURL = URL(string: "https://itunes.apple.com/search?")!
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    let query: [String: String] = [
        //    "term": "Inside Out 2015",
        //    "media": "movie",
        //    "lang": "en_us",
        //    "limit": "10"
        "api_key": "DEMO_KEY",
        ]
    
    let searchURL = baseURL.withQueries(query)!
    
    URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
        let decoder = JSONDecoder()
        
        if let data = data,
            let photoInfo = try? decoder.decode(PhotoInfo.self, from: data) {
            completion(photoInfo)
        } else {
            print("Either no data was returned, or data was not properly decoded.")
            completion(nil)
        }
    }.resume()
}
fetchPhotoInfo { (fetchedInfo) in
    print(fetchedInfo)
}

//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap{ URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

struct PhotoInfos: Codable {
    let results: [PhotoInfo]
}

//Deconding into custom model objects
struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    // Encoded data use the newly defined keys
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url//hdurl URL hdURL hd_url
        case copyright
    }
    
    //    access the JSON data's key/value
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}


//Function fetchPhotoInfo return PhotoInfo object.Networking-related code include
// baseURL,query,url,task and task.resume
//func fetchPhotoInfo(completion: @escaping([PhotoInfo]?) -> Void) {
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    let query: [String: String] = [
        "api_key": "DEMO_KEY"
//        "date": "2011-07-13"
    ]
    let url = baseURL.withQueries(query)!
//    guard let url = baseURL.withQueries(query) else {
////        completion(nil)
//        print("Unable to build URL with supplied queries.")
////        return
//    }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        
        if let data = data,
            //        let string = String(data: data, encoding: .utf8),
            // Convert JSON data to swift type
            let photoInfos = try? jsonDecoder.decode(PhotoInfos.self, from: data)
        {
            
            //        print(string)
            print(photoInfos)
//            return photoInfo
//            completion(photoInfos.results)
            
        } //else {
//            print("Either no data was returned, or data was not properly decoded.")
////            completion(nil)
////            completion(nil)
////            return
//        }
    }
    
    task.resume()

//}

//fetchPhotoInfo { (fetchedInfo) in
//    print(fetchedInfo)
//}


import UIKit
import PlaygroundSupport

//support asynchronous code
PlaygroundPage.current.needsIndefiniteExecution = true

//2.2---Modify a url with url components.URL withQueries
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap{ URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

//4.1-------------------Decode your JSON data to a custom model PhotoInfo objects
//initialize model objects using Codable
struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
//CodingKey that conforms to the CodingKey protocol inside your object.
//to map non-matching keys to your properties you need to declare a nested enum enumeration inside your object
    enum CodingKeys: String, CodingKey {
        case title
//use the newly defined keys
//PhotoInfo has a property called description that should map to the NASA APOD API explanation key
        case description = "explanation"
        case url
        case copyright
    }
//ignore the extraneous key/value pairs in the data that PhotoInfo will not include
    init(from decoder: Decoder) throws {
//return a KeyedCodingContainer that only contains the key/value pairs associated with the cases declared in CodingKeys
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}

//1-------website html
//!:  return nil if a url cannot be formed with the string
//let url = URL(string: "https://www.apple.com")!
//2.1--------------------work with an api
//let baseurl = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
//Move your networking code to a function
//func fetchPhotoInfo() -> PhotoInfo
/*Calling completion() executes the code passed into the completion parameter in the function call. The @escaping keyword tells the compiler that the code in the closure will be executed after the function has returned, or has finished executing all the code.*/
func fetchPhotoInfo(completion: @escaping(PhotoInfo?) -> Void){
    let baseurl = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    //2.2----
    let query: [String: String] = [
        "api_key": "DEMO_KEY",
        //    "date": "2011-07-13"
    ]
    
    let url = baseurl.withQueries(query)!
    //-------
    
    //first network request
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        //3.1---------Convert json data to swift types,[String: String] dictionary
        let jsonDecoder = JSONDecoder()
        
        if let data = data,
            //html xmlns.HTML description how a website should be displayed in a browser-not in an iOS app.
            //let string = String(data: data, encoding:.utf8)
            //3.2-----------
            //        let photoDictionary = try? jsonDecoder.decode([String: String].self, from: data)
            let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data)
        {
            //        print(data as? NSData)//unreadable,computer talk
            //        print(response)
            //        print(error)
            //        print(string)
//            print(photoInfo)
            completion(photoInfo)
        } else {
            print("Either no data was returned,or data was not properly decoded.")
            completion(nil)
        }
    }
    
    task.resume()

}

fetchPhotoInfo { (fetchedInfo) in
    print(fetchedInfo)
}

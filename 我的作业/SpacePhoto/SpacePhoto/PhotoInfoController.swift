import Foundation

struct PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping(PhotoInfo?) -> Void) {
        let baseURL = URL(string: "http://api.nasa.gov/planetary/apod")!
        
        let query: [String: String] = [
            "api_key": "DEMO_KEY",
            ]
        
        guard let url = baseURL.withQueries(query)!.withHTTPS() else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            if let data = data,
                let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            } else {
                print("Either no data was returned, or data was not properly decoded.")
                completion(nil)
            }
            }
            task.resume()
    }
}


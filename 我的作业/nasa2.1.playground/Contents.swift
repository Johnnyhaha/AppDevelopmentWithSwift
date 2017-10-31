//: Playground - noun: a place where people can play

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


//1-------website html
//!:  return nil if a url cannot be formed with the string
//let url = URL(string: "https://www.apple.com")!
//2.1--------------------work with an api
let baseurl = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!

//2.2----
let query: [String: String] = [
    "api_key": "DEMO_KEY",
    "date": "2011-07-13"
]

let url = baseurl.withQueries(query)!
//-------

//first network request
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data,
//html xmlns.HTML description how a website should be displayed in a browser-not in an iOS app.
        let string = String(data: data, encoding:.utf8)
    {
//        print(data as? NSData)//unreadable,computer talk
//        print(response)
//        print(error)
        print(string)
    }
}

task.resume()

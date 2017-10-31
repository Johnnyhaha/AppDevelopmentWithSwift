//: Playground - noun: a place where people can play

import UIKit

enum AdditionalKeys: String, CodingKey {
    case longDescription
}

init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decode(String.self, forKey: CodingKeys.name)
}

//
//  EmojiModel.swift
//  EmojiDictionary
//
//  Created by Johnny_L on 2017/9/24.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import Foundation

class Emoji {
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
}



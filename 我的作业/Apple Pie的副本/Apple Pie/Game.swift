//
//  Game.swift
//  Apple Pie
//
//  Created by Johnny_L on 2017/9/18.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectTimesRemaining: Int
    //4.---------获得字母，与列表字母比较，检查剩余的错误次数
    var guessedLetters: [Character]
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter) {
            incorrectTimesRemaining -= 1
        }
    }
    
    //5.-------------处理猜测的，要显示的数据，
    var formattedWord: String {
        var guessWord = ""
        for letter in word.characters {
            if guessedLetters.contains(letter) {
                guessWord += "\(letter)"
            }else {
                guessWord += "_"
            }
        }
        return guessWord
    }
}

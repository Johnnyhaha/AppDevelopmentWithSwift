
//
//  QuestionData.swift
//  PersonalityQuiz2
//
//  Created by Johnny_L on 2017/9/21.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import Foundation

//1.------------------------------------------------数据模型
//数组里面又有数组，不如用结构体
struct Question {
    var text: String //问题内容
    var type: ResponseType //什么类型的问题
    var answers: [Answer] //答案选项
}

//用枚举来列出三个不同但是确定的情况
enum ResponseType {
    case single,multiple,ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definination: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love, and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}

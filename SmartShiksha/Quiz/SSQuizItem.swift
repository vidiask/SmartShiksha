//
//  SSQuizItem.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 18/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

struct SSQuizItem : Codable {
    var isMultipleChoice:Bool
    var question: String
    var choice: [String]
    var answer: [String]
    var userAnswer:[String]?

    mutating func markUserAnswer(ans:String){
        userAnswer = isMultipleChoice ? userAnswer : [String]()
        if let uAnswer = userAnswer{
            if !uAnswer.contains(ans) {
                userAnswer!.append(ans)
            }
        }
    }
}

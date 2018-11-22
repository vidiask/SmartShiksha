//
//  SSQuizViewModel.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 18/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSQuizViewModel: NSObject {
    var quizes = [SSQuizItem]()

    override init() {
        super.init()
        if let data = loadJson("Quiz"){
            quizes = data
        }
    }

    func quizCount() -> Int {
        return quizes.count
    }

    func getQuiz(atIndex:Int) -> SSQuizItem? {
        if atIndex < 0 || atIndex >= quizes.count{
            return nil
        }else{
            return quizes[atIndex]
        }
    }

    func setAnswerSelection(index:Int,ans:String) -> Void {
        if var quiz = getQuiz(atIndex: index) {
            quiz.markUserAnswer(ans: ans)
        }
    }

    @discardableResult
    func loadJson(_ fileName: String) -> [SSQuizItem]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([SSQuizItem].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

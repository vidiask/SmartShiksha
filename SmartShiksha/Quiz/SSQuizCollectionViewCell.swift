//
//  SSQuizCollectionViewCell.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 18/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSQuizCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var quizItem : SSQuizItem?

    func refreshCell(quiz:SSQuizItem) -> Void {
        quizItem = quiz
        questionLabel.text = quiz.question
        tableView.allowsMultipleSelection = quiz.isMultipleChoice
        tableView.reloadData()
    }

    class func identifier() -> String{
        return "SSQuizCollectionViewCellID"
    }
}

extension SSQuizCollectionViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let choices = quizItem?.choice{
            return choices.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SSQuizOptionTableViewCell.identifier(), for: indexPath) as! SSQuizOptionTableViewCell
        cell.accessoryType = .checkmark
        if let choices = quizItem?.choice{
            cell.refresh(option: choices[indexPath.row], marker: "\(indexPath.row + 1) .")
        }
        return cell
    }

    func showSelectedOptions() -> Void {
        if let quiz = quizItem{
            for selectedAnswer in quiz.userAnswer!{

            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}


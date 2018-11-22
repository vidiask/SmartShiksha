//
//  SSQuizViewController.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 18/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSQuizViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = SSQuizViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Quiz"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SSQuizViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.quizCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SSQuizCollectionViewCell.identifier(), for: indexPath) as! SSQuizCollectionViewCell
        if let quiz = viewModel.getQuiz(atIndex: indexPath.row){
            cell.refreshCell(quiz: quiz)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

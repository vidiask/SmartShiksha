//
//  SSNotesViewController.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSNotesViewController: UIViewController {

    let viewModel = SSNotesViewModel()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Notes"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshCollectionView()
        refreshTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addSubjectAction(_ sender: UIBarButtonItem){
        let alertController = UIAlertController(title: "Add New Subject", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Subject Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            if let title = firstTextField.text{
                self.viewModel.addSubjectToDB(title: title)
                self.refreshCollectionView()
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func refreshCollectionView() -> Void {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func refreshTableView() -> Void {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "notesEditorSegueID"{
            let dc = segue.destination as? SSNoteEditorViewController
            dc?.viewModel = viewModel
        }
    }


}

extension SSNotesViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.subjectCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subjectCellID", for: indexPath)
        if let label = cell.viewWithTag(999) as? UILabel{
            if let subject = viewModel.getSubject(index: indexPath.row){
                label.text = subject.mSubjectName
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let subject = viewModel.getSubject(index: indexPath.row){
            viewModel.setSelectedSubject(subject: subject)
            refreshTableView()
        }
    }
}


extension SSNotesViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notesCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesTitleCellID", for: indexPath)
        if indexPath.row == 0{
            cell.textLabel?.text = "Create New Note"
        }else{
            if let notes = viewModel.getNotes(index: indexPath.row - 1){
                cell.textLabel?.text = notes.mTitleText
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "notesEditorSegueID", sender: indexPath)
    }
}

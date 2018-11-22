//
//  SSAttendanceViewController.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSAttendanceViewController: UIViewController {

    let viewModel = SSAttendanceViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Attendence"
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

extension SSAttendanceViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.studentCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SSAttendaceTableViewCell.identifier(), for: indexPath) as! SSAttendaceTableViewCell
        if let student = viewModel.getStudent(atIndex: indexPath.row){
            cell.refresh(student,index: indexPath) { [weak self] (indexPath) in
                if let index = indexPath?.row{
                    self?.viewModel.studentAttendance(index: index)
                }
            }
        }
        return cell
    }
}

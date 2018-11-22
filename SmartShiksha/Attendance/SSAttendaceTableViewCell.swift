//
//  SSAttendaceTableViewCell.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSAttendaceTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attendanceMarkerButton: UIButton!
    var indexPath: IndexPath?

    typealias CompletionHandler = (_ indexPath:IndexPath?) -> Void
    var completionHandler:CompletionHandler?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func refresh(_ student: Student, index:IndexPath , completion:@escaping CompletionHandler) -> Void {
        completionHandler = completion
        indexPath = index
        nameLabel.text = student.name
        profilePicImageView.image = UIImage(named: student.gender)
        attendanceMarkerButton.isSelected = student.isPresent
    }

    @IBAction func markAttendanceAction(_ sender: UIButton){
        attendanceMarkerButton.isSelected = !attendanceMarkerButton.isSelected
        completionHandler?(indexPath)
    }

    class func identifier() -> String{
        return "SSAttendaceTableViewCell"
    }
}

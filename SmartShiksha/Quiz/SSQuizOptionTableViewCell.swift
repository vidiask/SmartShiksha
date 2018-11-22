//
//  SSQuizOptionTableViewCell.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 18/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSQuizOptionTableViewCell: UITableViewCell {

    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionMarker: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func refresh(option:String,marker:String) -> Void {
        optionLabel.text = option
        optionMarker.text = marker
    }

    class func identifier() -> String{
        return "SSQuizOptionTableViewCellID"
    }
}

//
//  ThumbnailGridCell.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 2017/07/03.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class ThumbnailGridCell: UICollectionViewCell {
    override var isHighlighted: Bool {
        didSet {
            imageView.alpha = isHighlighted ? 0.8 : 1
        }
    }
    var image: UIImage? = nil {
        didSet {
            imageView.image = image
        }
    }
    var pageNumber = 0 {
        didSet {
            pageNumberLabel.text = String(pageNumber)
        }
    }
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var pageNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        pageNumberLabel.isHidden = true
    }

    override func prepareForReuse() {
        imageView.image = nil
    }
}

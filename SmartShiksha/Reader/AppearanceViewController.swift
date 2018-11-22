//
//  AppearanceViewController.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 2017/07/03.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class AppearanceViewController: UIViewController {
    @IBOutlet weak var brightnessSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        brightnessSlider.value = Float(UIScreen.main.brightness)
        brightnessSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        UIScreen.main.brightness = CGFloat(brightnessSlider.value)
    }
}

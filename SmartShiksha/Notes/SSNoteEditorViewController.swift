//
//  SSNoteEditorViewController.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSNoteEditorViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    weak var viewModel: SSNotesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        textView.resignFirstResponder()
        viewModel?.addNotesToSubject(title: textView.text)
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

//
//  AddNoteViewController.swift
//  LMANotes
//
//  Created by Arifin Firdaus on 29/05/20.
//  Copyright © 2020 Learn Make Application. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapDoneButton(_ sender: UIBarButtonItem) {
        guard let text = titleTextField.text else { return }
        guard let content = contentTextView.text else { return }
        
        if text == "" || content == "" {
            return
        }
        
        print(text)
        print(content)
        
        dismiss(animated: true, completion: nil)
    }
    
    
}

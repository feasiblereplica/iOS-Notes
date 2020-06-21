//
//  NoteDetailViewController.swift
//  LMANotes
//
//  Created by Arifin Firdaus on 12/06/20.
//  Copyright © 2020 Learn Make Application. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    var contentText: String?

    @IBOutlet weak private var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.text = contentText
    }
  
}

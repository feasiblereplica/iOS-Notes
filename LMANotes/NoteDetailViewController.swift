//
//  NoteDetailViewController.swift
//  LMANotes
//
//  Created by Arifin Firdaus on 12/06/20.
//  Copyright © 2020 Learn Make Application. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    var note: Note?

    @IBOutlet weak private var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = note?.title
        contentTextView.text = note?.content
    }
  
}

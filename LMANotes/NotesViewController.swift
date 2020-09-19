//
//  NotesViewController.swift
//  LMANotes
//
//  Created by Arifin Firdaus on 09/05/20.
//  Copyright © 2020 Learn Make Application. All rights reserved.
//

import UIKit

struct Note {
    let title: String
    let content: String
}

class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var notes = [
        Note(title: "iOS Learning", content: "I have to mastering tableView"),
        Note(title: "Groceries", content: "Apple, Banana, Oil, Meat, 7 PM."),
        Note(title: "Basic Programming", content: "variables, data types, if-else, array, loop, fuctions"),
        Note(title: "iOS UI Architecture", content: "MVC, MVVM, MVP, VIPER, etc."),
        Note(title: "Swift UI Building", content: "Storyboard, UIKit Swift Programmatic UI, SwiftUI")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        setupCell()
    }
    
    func setupCell() {
        let nib = UINib(nibName: "NoteCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: NoteCell.cellId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SEGUE_NOTE_DETAIL" {
            if let viewController = segue.destination as? NoteDetailViewController {
                if let note = sender as? Note {
                    viewController.note = note
                }
            }
        }
    }
    
}


// MARK: - UITableViewDataSource

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.cellId, for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.titleLabel?.text = note.title
        cell.contentLabel?.text = note.content
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NoteCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        performSegue(withIdentifier: "SEGUE_NOTE_DETAIL", sender: note)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

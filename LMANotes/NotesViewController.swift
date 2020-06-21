//
//  NotesViewController.swift
//  LMANotes
//
//  Created by Arifin Firdaus on 09/05/20.
//  Copyright © 2020 Learn Make Application. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
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
            if let destinationViewController = segue.destination as? NoteDetailViewController {
                if let contentText = sender as? String {
                    destinationViewController.contentText = contentText
                }
            }
        }
    }
    
}


// MARK: - UITableViewDataSource

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.cellId, for: indexPath) as! NoteCell
        cell.titleLabel?.text = "Title at row \(indexPath.row)"
        cell.contentLabel?.text = "Content at row \(indexPath.row)"
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NoteCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentText = "my content at row \(indexPath.row)"
        performSegue(withIdentifier: "SEGUE_NOTE_DETAIL", sender: contentText)
    }
    
}

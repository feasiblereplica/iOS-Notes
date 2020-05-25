//
//  NoteCell.swift
//  LMANotes
//
//  Created by Arifin Firdaus on 17/05/20.
//  Copyright © 2020 Learn Make Application. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    static let cellId = "NoteCell"
    static let cellHeight: CGFloat = 84

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

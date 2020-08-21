//
//  NoteTableViewCell.swift
//  ProjectManager
//
//  Created by conner on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var previewTF: UITextView!
    
    func configureViews(for note: Note) {
        titleLabel.text = note.title
        dateLabel.text = dateFormatter.string(from: note.date)
        previewTF.text = note.contents ?? ""
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }

    
}

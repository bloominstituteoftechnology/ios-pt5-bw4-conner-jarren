//
//  NoteDetailViewController.swift
//  ProjectManager
//
//  Created by conner on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    var noteController: NoteController?
    var note: Note?
    
    // MARK: IBOutlets
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var contentTV: UITextView!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // No lorem ipsum
        contentTV.text = ""
        
        if let note = note {
            // Editing/Viewing, fill fields
            titleTF.text = note.title
            contentTV.text = note.contents
        }
    }
    
    // MARK: IBActions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if let title = titleTF.text, let contents = contentTV.text {
            // Editing Note
            if let note = note {
                note.title = title
                note.contents = contents
            } else {
                // Add note
                noteController?.addNote(Note(title: title, contents: contents))
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
}

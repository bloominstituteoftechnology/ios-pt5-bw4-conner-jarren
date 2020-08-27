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
    
    // MARK: IBOutlets
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var contentTV: UITextView!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // No lorem ipsum
        contentTV.text = ""
        
        if let index = noteController?.selectedTableViewIndex {
            // Editing/Viewing, fill fields
            let note = noteController!.notes[index]
            titleTF.text = note.title
            contentTV.text = note.contents
        }
    }
    
    // MARK: IBActions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if let title = titleTF.text, let contents = contentTV.text, !title.isEmpty, !contents.isEmpty {
            // Editing Note
            if let index = noteController?.selectedTableViewIndex {
                noteController?.replaceNote(at: index, with: Note(title: title, contents: contents))
            } else {
                // Add note
                noteController?.addNote(Note(title: title, contents: contents))
            }
            navigationController?.popViewController(animated: true)
        } else {
            var missingFields: [String] = []
            if titleTF.text == nil || titleTF.text == "" { missingFields.append("Title") }
            if contentTV.text == nil || contentTV.text == "" { missingFields.append("Note content") }
            presentAlertController(for: missingFields)
        }
    }
    
    // MARK: Private Functions
    private func presentAlertController(for strings: [String]) {
        var missingFields = ""
        for string in strings {
            missingFields.append("\(string), ")
        }
        missingFields = String(missingFields.dropLast(2)) // Drops ", "
        let alert = UIAlertController(title: "Warning", message: "Invalid input for \(missingFields)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}

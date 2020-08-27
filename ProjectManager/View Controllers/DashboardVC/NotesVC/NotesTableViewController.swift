//
//  NotesTableViewController.swift
//  ProjectManager
//
//  Created by conner on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    let reuseIdentifier = "NoteCell"
    
    var noteController = NoteController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let exampleNote = Note(title: "Todo-List", contents: "1) Need to purchase tools")
        noteController.addNote(exampleNote)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let noteCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? NoteTableViewCell {
            noteCell.configureViews(for: noteController.noteAtIndex(indexPath.row))
            cell = noteCell
        }
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            noteController.removeNoteAtIndex(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Set Cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let noteDetailVC = segue.destination as? NoteDetailViewController {
            if segue.identifier == "ViewNoteSegue", let indexPath = tableView.indexPathForSelectedRow {
                noteDetailVC.noteController = noteController
                noteDetailVC.noteController?.selectedTableViewIndex = indexPath.row
            } else if segue.identifier == "AddNoteSegue" {
                noteDetailVC.noteController = noteController
                noteDetailVC.noteController?.selectedTableViewIndex = nil
            }
        }
    }
}

//
//  NotesTableViewController.swift
//  ProjectManager
//
//  Created by conner on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

let reuseIdentifier = "NoteCell"

class NotesTableViewController: UITableViewController {
    
    var notes: [Note] = [Note(title: "Test Note", contents: "Here are the contents of my note.")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let noteCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? NoteTableViewCell {
            noteCell.configureViews(for: notes[indexPath.row])
            cell = noteCell
        }
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let noteDetailVC = segue.destination as? NotesDetailViewController {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            noteDetailVC.note = notes[indexPath.row]
        }
    }

}

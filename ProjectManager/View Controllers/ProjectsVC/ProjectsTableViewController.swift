//
//  ProjectsTableViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/19/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
    
    var projectArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exampleProjectName = "Test Project"
        projectArray.append(exampleProjectName)

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return projectArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath)

        cell.textLabel?.text = projectArray[indexPath.row]

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

}
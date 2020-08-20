//
//  ProjectsTableViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/19/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
    
    var projects: [Project] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Project created, haven't decided on [Product]s needed and haven't added any [Note]s
        var testProject = Project(title: "Garden", description: "Building a wooden box for a raised garden bed")
        
        // Add products I have in mind
        let gardenProducts = [
            Product(name: "2x4", purchaseDate: NSDate.now, price: 5.00),
            Product(name: "Topsoil", price: 10.00),     // User doesn't know purchase date, TODO: Add quantity to Product model
        ]
        
        // Create some notes
        let gardenNotes = [
            Note(title: "Buy-list", contents: "I need to purchase a shovel")
        ]
        
        // Add those to the project once done
        testProject.products = gardenProducts
        testProject.notes = gardenNotes
        
        projects.append(testProject)

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return projects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath)

        cell.textLabel?.text = projects[indexPath.row].title

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

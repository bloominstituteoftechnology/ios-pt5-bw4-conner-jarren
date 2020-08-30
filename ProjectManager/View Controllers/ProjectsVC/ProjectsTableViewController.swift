//
//  ProjectsTableViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/19/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
    
    let projectController = ProjectController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Example Data
        
        // Project created, haven't decided on [Product]s needed and haven't added any [Note]s
        projectController.addProject(Project(title: "Garden", description: "Building a wooden box for a raised garden bed"))
        
        // Add products I have in mind
        projectController.projects[0].productController.addProduct(Product(name: "2x4", purchaseDate: NSDate.now, price: 5.00))
        projectController.projects[0].productController.addProduct(Product(name: "Topsoil", price: 10.00))
        
        // Create some notes
        projectController.projects[0].noteController.addNote(Note(title: "Buy-list", contents: "I need to purchase a shovel"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    @IBAction func unwindToProjectsVC(_ sender: UIStoryboardSegue){}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectController.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as? ProjectTableViewCell {
            cell.configureViews(with: projectController.projects[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    // Set Cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            projectController.removeProjectAtIndex(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ProjectSegue") {
            if let dashboardVC = segue.destination as? DashboardMainViewController {
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                dashboardVC.project = projectController.projects[indexPath.row]
            }
        } else if (segue.identifier == "AddProjectSegue") {
            if let addProjectVC = segue.destination as? AddProjectViewController {
                addProjectVC.projectController = projectController
            }
        }
    }

}

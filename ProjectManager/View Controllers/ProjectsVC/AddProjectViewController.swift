//
//  AddProjectViewController.swift
//  ProjectManager
//
//  Created by conner on 8/30/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController {
    
    var projectController: ProjectController?

    @IBOutlet var titleTF: UITextField!
    @IBOutlet var descriptionTV: UITextView!
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if let projectController = projectController {
            if let title = titleTF.text, !title.isEmpty {
                if let description = descriptionTV.text {
                    projectController.addProject(Project(title: title, description: description))
                } else {
                    projectController.addProject(Project(title: title))
                }
            } else {
                presentAlertController(for: ["Title"])
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func presentAlertController(for strings: [String]) {
        var missingFields = ""
        for string in strings {
            missingFields.append("\(string), ")
        }
        missingFields = String(missingFields.dropLast(2))
        let alert = UIAlertController(title: "Warning", message: "Invalid input for \(missingFields)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}

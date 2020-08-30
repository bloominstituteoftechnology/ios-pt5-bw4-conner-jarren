//
//  ProjectTableViewCell.swift
//  ProjectManager
//
//  Created by conner on 8/30/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    @IBOutlet var projectTitleLabel: UILabel!
    @IBOutlet var descriptionTV: UITextView!
    
    func configureViews(with project: Project) {
        projectTitleLabel.text = project.title
        descriptionTV.text = project.description ?? ""
    }
}

//
//  FinancialTableViewCell.swift
//  ProjectManager
//
//  Created by conner on 8/29/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class FinancialTableViewCell: UITableViewCell {
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var spendingLabel: UILabel!
    @IBOutlet var colorCircle: UIImageView!
    
    func configureViews(category: String, spending: Float, color: UIColor) {
        layer.cornerRadius = 15
        categoryLabel.text = category
        spendingLabel.text = "$" + String(format: "%.2f", spending)
        colorCircle.tintColor = color
    }
    
}

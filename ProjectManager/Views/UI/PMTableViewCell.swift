//
//  PMTableViewCell.swift
//  ProjectManager
//
//  Created by conner on 8/27/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class PMTableViewCell: UITableViewCell {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor(red: 30/255, green: 11/255, blue: 112/255, alpha: 1.0)
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.borderColor = CGColor(srgbRed: 145/255, green: 143/255, blue: 156/255, alpha: 1.0)
        layer.borderWidth = 3
    }
}

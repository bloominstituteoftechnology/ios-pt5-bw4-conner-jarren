//
//  PMLabel.swift
//  ProjectManager
//
//  Created by conner on 8/26/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class PMLabel: UILabel {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        textColor = .white
        font = UIFont(name: "Roboto-Light", size: 20.0)
    }

}

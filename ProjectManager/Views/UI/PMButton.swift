//
//  PMButton.swift
//  ProjectManager
//
//  Created by conner on 8/26/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class PMButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor(red: 30/255, green: 11/255, blue: 112/255, alpha: 1.0)
        titleLabel?.font = UIFont(name: "Roboto-Regular", size: 14.0)
        tintColor = .white
        layer.cornerRadius = 15
        layer.masksToBounds = true
        // White border
        layer.borderColor = CGColor(srgbRed: 145/255, green: 143/255, blue: 156/255, alpha: 1.0)
        layer.borderWidth = 2
    }
}

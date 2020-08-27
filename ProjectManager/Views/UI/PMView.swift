//
//  PMView.swift
//  ProjectManager
//
//  Created by conner on 8/26/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class PMView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor(red: 30/255, green: 11/255, blue: 112/255, alpha: 1.0)
        layer.cornerRadius = 15
        layer.masksToBounds = true
        // White border
        // layer.borderColor = CGColor(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.borderColor = CGColor(srgbRed: 145/255, green: 143/255, blue: 156/255, alpha: 1.0)
        layer.borderWidth = 3
    }
}

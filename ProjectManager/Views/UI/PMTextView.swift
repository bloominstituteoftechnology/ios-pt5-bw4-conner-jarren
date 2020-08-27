//
//  PMTextView.swift
//  ProjectManager
//
//  Created by conner on 8/26/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class PMTextView: UITextView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        textColor = .white
        backgroundColor = UIColor(red: 145/255, green: 143/255, blue: 156/255, alpha: 1.0)
        font = UIFont(name: "Roboto-Regular", size: 15.0)
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
}

//
//  PMDatePicker.swift
//  ProjectManager
//
//  Created by conner on 8/26/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class PMDatePicker: UIDatePicker {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setValue(UIColor.white, forKey: "textColor")
    }
}

//
//  FinanciesViewController.swift
//  ProjectManager
//
//  Created by conner on 8/24/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class FinanciesViewController: UIViewController {
    
    var financialData: [String:Float] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        financialData["Materials"] = 250.00
        financialData["Services"] = 150.00
        print(financialData)
    }
}

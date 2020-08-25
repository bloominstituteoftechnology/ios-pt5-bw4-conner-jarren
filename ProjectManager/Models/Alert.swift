//
//  Alert.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/24/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}

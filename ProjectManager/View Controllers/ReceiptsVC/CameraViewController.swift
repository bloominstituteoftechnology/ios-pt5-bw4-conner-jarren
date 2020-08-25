//
//  CameraViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/25/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        presentCamera()
    }

    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
}

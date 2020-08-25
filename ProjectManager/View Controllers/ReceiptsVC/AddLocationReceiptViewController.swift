//
//  AddLocationReceiptViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit
import MapKit

class AddLocationReceiptViewController: UIViewController {

    @IBOutlet var mapKitView: MKMapView!
    @IBOutlet var locationTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if locationTextField.text == "" {
            Alert.showIncompleteFormAlert(on: self)
        } else{
            performSegue(withIdentifier: "toDateVC", sender: UIButton.self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDateVC", let destination = segue.destination as? AddDateReceiptViewController {
            guard let location = locationTextField.text else {return}
            destination.locationString = location
        }
    }
    
}

extension AddLocationReceiptViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

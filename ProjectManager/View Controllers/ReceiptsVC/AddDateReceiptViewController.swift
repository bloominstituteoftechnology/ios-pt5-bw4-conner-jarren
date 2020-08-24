//
//  AddDateReceiptViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class AddDateReceiptViewController: UIViewController {
    
    let receiptController = ReceiptController()
    
    @IBOutlet var datePickerView: UIDatePicker!
    
    var locationString: String = ""
    var dateString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        #warning("Need to add default value for the date to be the date the VC was called.")
            performSegue(withIdentifier: "toPictureVC", sender: UIButton.self)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        dateString = receiptController.dateFormatterConfig(datePickerView.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPictureVC", let destination = segue.destination as? AddPictureReceiptViewController {
            
            destination.locationString = locationString
            destination.dateString = dateString
        }
    }
    
}

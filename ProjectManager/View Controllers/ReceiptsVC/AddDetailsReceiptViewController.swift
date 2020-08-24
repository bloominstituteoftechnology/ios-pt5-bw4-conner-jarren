//
//  AddDetailsReceiptViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class AddDetailsReceiptViewController: UIViewController {
    //TODO: Need ot implement swiftUI for a graph view that updated in real time
    @IBOutlet var graphView: UIView!
    
    @IBOutlet var itemNameTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var quantityTextField: UITextField!
    @IBOutlet var categoryTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    
    var locationString: String = ""
    var dateString: String = ""
    var imageViewPreview: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = ""
    }

    @IBAction func reviewButtonPressed(_ sender: Any) {
        #warning("Need to implement to protect seguing without data")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toReviewVC", let destination = segue.destination as? ReviewReceiptViewController {
            destination.locationString = locationString
            destination.dateString = dateString
            destination.receiptImage = imageViewPreview
            
            guard let name = itemNameTextField.text else {return}
            destination.nameString = name
            
            guard let price = priceTextField.text else {return}
            destination.priceString = price
            
            guard let quantity = quantityTextField.text else {return}
            destination.quantityString = quantity
            
            guard let category = categoryTextField.text else {return}
            destination.categoryString = category
            
            guard let description = descriptionTextView.text else {return}
            destination.descriptionString = description
            
        }
    }
}

extension AddDetailsReceiptViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

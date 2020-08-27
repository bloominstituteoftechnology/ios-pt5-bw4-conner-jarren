//
//  ProductDetailViewController.swift
//  ProjectManager
//
//  Created by conner on 8/21/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var productController: ProductController?
    
    // MARK: - IBOutlets
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var priceTF: UITextField!
    @IBOutlet var quantityTF: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var dateToggleButton: UIButton!
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = NSDate.now
        
        // Editing Existing Product, populate fields
        if let index = productController?.selectedTableViewIndex {
            let product = productController!.products[index]
            nameTF.text = product.name
            priceTF.text = String(format: "%.2f", product.price)
            totalCostLabel.text = String(format: "$%.2f", product.totalCost)
            quantityTF.text = "\(product.quantity)"
            if let purchaseDate = product.purchaseDate {
                datePicker.date = purchaseDate
                dateToggleButton.setTitle("Disable Date", for: .normal)
            } else {
                datePicker.isEnabled = false
                dateToggleButton.setTitle("Enable Date", for: .normal)
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        // Verify Input Fields
        if let name = nameTF.text, !name.isEmpty,
            let priceStr = priceTF.text, !priceStr.isEmpty, let price = Float(priceStr),
            let quantityStr = quantityTF.text, !quantityStr.isEmpty, let quantity = Int(quantityStr) {
            
            var date: Date? = nil
            if datePicker.isEnabled {
                date = datePicker.date
            }
            
            if let index = productController?.selectedTableViewIndex {
                productController?.replaceProduct(at: index, with: Product(name: name, purchaseDate: date, price: price, quantity: quantity))
            } else {
                productController?.addProduct(Product(name: name, purchaseDate: date, price: price, quantity: quantity))
            }
            navigationController?.popViewController(animated: true)
            
        } else {
            // Input fields empty, alert user to what needs to be filled
            var missingFields: [String] = []
            if nameTF.text == nil || nameTF.text == "" { missingFields.append("Name") }
            if priceTF.text == nil || priceTF.text == "" { missingFields.append("Price") }
            if quantityTF.text == nil || quantityTF.text == "" { missingFields.append("Quantity") }
            presentAlertController(for: missingFields)
        }
        
    }
    
    @IBAction func dateToggleTapped(_ sender: UIButton) {
        datePicker.isEnabled.toggle()
        if datePicker.isEnabled {
            dateToggleButton.setTitle("Disable Date", for: .normal)
        } else {
            dateToggleButton.setTitle("Enable Date", for: .normal)
        }
    }
    
    @IBAction func priceTFEdited(_ sender: UITextField) {
        updateTotalCost()
    }
    
    @IBAction func quantityTFEdited(_ sender: UITextField) {
        updateTotalCost()
    }
    
    // MARK: - Private Functions and Variables
    private func updateTotalCost() {
        guard let price = Float(priceTF.text!), let quantity = Float(quantityTF.text!) else {
            totalCostLabel.text = ""
            return
        }
        totalCostLabel.text = String(format: "$%.2f", price * quantity)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
    
    private func presentAlertController(for strings: [String]) {
        var missingFields = ""
        for string in strings {
            missingFields.append("\(string), ")
        }
        missingFields = String(missingFields.dropLast(2))
        let alert = UIAlertController(title: "Warning", message: "Invalid input for \(missingFields)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }

}

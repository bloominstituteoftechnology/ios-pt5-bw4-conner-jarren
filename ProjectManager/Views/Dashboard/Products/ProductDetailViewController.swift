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
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var datePurchasedTF: UITextField!
    @IBOutlet var priceTF: UITextField!
    @IBOutlet var quantityTF: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
        
        // Editing Existing Product, populate fields
        if let index = productController?.selectedTableViewIndex {
            let product = productController!.products[index]
            nameTF.text = product.name
            priceTF.text = "\(String(format: "%.2f", product.totalCost))"
            quantityTF.text = "\(product.quantity)"
            if let date = product.purchaseDate {
                datePurchasedTF.text = dateFormatter.string(from: date)
                datePicker.date = date
            }
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        // Nonnull input fields
        if let name = nameTF.text, let priceStr = priceTF.text, let price = Float(priceStr), let quantityStr = quantityTF.text, let quantity = Int(quantityStr) {
            if let index = productController?.selectedTableViewIndex {
                productController?.replaceProduct(at: index, with: Product(name: name, purchaseDate: datePicker.date, price: price, quantity: quantity))
            } else {
                productController?.addProduct(Product(name: name, purchaseDate: datePicker.date, price: price, quantity: quantity))
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
}

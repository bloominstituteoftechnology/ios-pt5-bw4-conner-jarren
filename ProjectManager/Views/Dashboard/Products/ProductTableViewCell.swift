//
//  ProductTableViewCell.swift
//  ProjectManager
//
//  Created by conner on 8/21/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ProductTableViewCell: PMTableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: PMLabel!
    @IBOutlet var priceLabel: PMLabel!
    @IBOutlet var quantityLabel: PMLabel!
    @IBOutlet var costLabel: PMLabel!
    
    func configureViews(for product: Product) {
        nameLabel.text = product.name
        priceLabel.text = "Price: \(String(format: "$%.2f", product.price))"
        quantityLabel.text = "Quantity: \(product.quantity)"
        costLabel.text = "Total: \(String(format: "$%.2f", product.totalCost))"
        if let purchaseDate = product.purchaseDate {
            dateLabel.text = "Purchased: " + dateFormatter.string(from: purchaseDate)
        } else {
            dateLabel.text = ""
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
}

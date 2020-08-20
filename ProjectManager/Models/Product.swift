//
//  Product.swift
//  ProjectManager
//
//  Created by conner on 8/18/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import Foundation

struct Product {
    var name: String
    var purchaseDate: Date?
    var price: Float
    var quantity: Int
    
    var totalCost: Float {
        price * Float(quantity)
    }
    
    init(name: String, purchaseDate: Date? = nil, price: Float, quantity: Int = 1) {
        self.name = name
        self.purchaseDate = purchaseDate
        self.price = price
        self.quantity = quantity
    }
}

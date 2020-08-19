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
    
    init(name: String, purchaseDate: Date? = nil, price: Float) {
        self.name = name
        self.purchaseDate = purchaseDate
        self.price = price
    }
}

//
//  ProductController.swift
//  ProjectManager
//
//  Created by conner on 8/21/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import Foundation

class ProductController {
    var products: [Product] = []
    
    var selectedTableViewIndex: Int? = nil

    var count: Int {
        products.count
    }
    
    func addProduct(_ product: Product) {
        products.append(product)
    }
    
    func removeProductAtIndex(_ index: Int) {
        products.remove(at: index)
    }
    
    func productAtIndex(_ index: Int) -> Product {
        products[index]
    }
    
    func replaceProduct(at index: Int, with product: Product) {
        products.remove(at: index)
        products.insert(product, at: index)
    }
    
}

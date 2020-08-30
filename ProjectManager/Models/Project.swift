//
//  Project.swift
//  ProjectManager
//
//  Created by conner on 8/18/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import Foundation

struct Project {
    var title: String
    var description: String?
    let productController = ProductController()
    let noteController = NoteController()
    let receiptController = ReceiptController()
    var financialDictionary: [String:Float] = [:]   // [Category:Spending]
    
    init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
    }
}

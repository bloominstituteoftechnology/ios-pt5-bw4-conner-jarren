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
    var products: [Product]?
    var notes: [Note]?
    var receipts: [Receipt]?
    var spendingDictionary: [String:Float]
    
    init(title: String,
         description: String? = nil,
         products: [Product]? = nil,
         notes: [Note]? = nil,
         receipts: [Receipt]? = nil,
         spendingDictionary: [String:Float] = [:])
    {
        self.title = title
        self.description = description
        self.products = products
        self.notes = notes
        self.spendingDictionary = spendingDictionary
    }
}

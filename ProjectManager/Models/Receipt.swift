//
//  Receipt.swift
//  ProjectManager
//
//  Created by conner on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import Foundation
import UIKit

struct Receipt {
    // Basic Receipt info
    var title: String
    var totalCost: String
    var category: String
    var image: UIImage?
    var date: String
    
    // Array of products on receipt
    var productsPurchased: [Product]?
    
    // Location
    var placeOfPurchase: String
    var latitude: Double?
    var longitude: Double?
}

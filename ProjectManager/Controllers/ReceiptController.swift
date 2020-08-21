//
//  ReceiptController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import Foundation

class ReceiptController {
    var receipts: [Receipt] = []
    
    var count: Int {
        receipts.count
    }
    
    func addReceipt(_ receipt: Receipt) {
        receipts.append(receipt)
    }
    
    func removeReceiptAtIndex(_ index: Int) {
        receipts.remove(at: index)
    }
    
}

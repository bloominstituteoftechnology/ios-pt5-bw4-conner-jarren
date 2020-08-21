//
//  ReceiptController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import Foundation

class ReceiptController {
    let date = Date(timeIntervalSinceReferenceDate: 118800)
    let dateFormatter = DateFormatter()
    
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
    
    func dateFormatterConfig(_ date: Date) -> String {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMddyy")
        
        return dateFormatter.string(from: date)
    }
    
}

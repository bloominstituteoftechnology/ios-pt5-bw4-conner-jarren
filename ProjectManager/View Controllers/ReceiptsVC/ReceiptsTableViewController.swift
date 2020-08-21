//
//  ReceiptsTableViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ReceiptsTableViewController: UITableViewController {

    let receiptController = ReceiptController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var testReceipt = Receipt(title: "Soil", totalCost: 25.69, category: "Outdoors", image: nil, date: NSDate.now as NSDate, placeOfPurchase: "Home Depot", latitude: 100, longitude: 100)
        
        receiptController.addReceipt(testReceipt)

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "receiptCell", for: indexPath)

        // Configure the cell...

        return cell
    }

}

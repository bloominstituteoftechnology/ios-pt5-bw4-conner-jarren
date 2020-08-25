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
    
    var locationString: String = ""
    var dateString: String = ""
    var nameString: String = ""
    var priceString: String = ""
    var quantityString: String = ""
    var categoryString: String = ""
    var descriptionString: String = ""
    
    var receiptImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #warning("Reminder to remove test data")
        let testReceipt = Receipt(title: "Soil", totalCost: "25.69", category: "Outdoors", image: nil, date: receiptController.dateFormatterConfig(NSDate.now), description: "Fake text", placeOfPurchase: "Home Depot", latitude: 100, longitude: 100)
        
        receiptController.addReceipt(testReceipt)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailReceiptVC", let destination = segue.destination as? DetailReceiptViewController {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                destination.detailReceipt = receiptController.receipts[indexPath.row]
            }
        }
    }

    @IBAction func unwindToReceiptTableView(_ sender: UIStoryboardSegue){
        if sender.source is ReviewReceiptViewController {
            guard let senderVC = sender.source as? ReviewReceiptViewController else { return }
            locationString = senderVC.locationString
            dateString = senderVC.dateString
            nameString = senderVC.nameString
            priceString = senderVC.priceString
            quantityString = senderVC.quantityString
            categoryString = senderVC.categoryString
            descriptionString = senderVC.descriptionString
            receiptImage = senderVC.receiptImage
            
            receiptController.addReceipt(Receipt(title: locationString, totalCost: priceString, category: categoryString, image: receiptImage, date: dateString, description: descriptionString, placeOfPurchase: locationString))
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptController.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "receiptCell", for: indexPath)

        cell.textLabel?.text = "$\(receiptController.receipts[indexPath.row].totalCost)"
        cell.detailTextLabel?.text = "\(receiptController.receipts[indexPath.row].date)"
        
        return cell
    }

}

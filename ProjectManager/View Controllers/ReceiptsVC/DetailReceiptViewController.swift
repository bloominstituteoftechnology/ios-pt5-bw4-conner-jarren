//
//  DetailReceiptViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class DetailReceiptViewController: UIViewController {
    
    @IBOutlet var receiptPreviewImageView: UIImageView!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var placeOfPurchaseLabel: UILabel!
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    
    lazy var detailReceipt = Receipt(title: "", totalCost: "", category: "", image: UIImage(), date: "", description: "", quantity: "", placeOfPurchase: "")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        receiptPreviewImageView.image = detailReceipt.image
        dateLabel.text = detailReceipt.date
        placeOfPurchaseLabel.text = detailReceipt.placeOfPurchase
        itemNameLabel.text = detailReceipt.title
        priceLabel.text = detailReceipt.totalCost
        #warning("need to change the receipt controller")
//        quantityLabel.text = detailReceipt.quantity
        descriptionTextView.text = detailReceipt.description
    }

}

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

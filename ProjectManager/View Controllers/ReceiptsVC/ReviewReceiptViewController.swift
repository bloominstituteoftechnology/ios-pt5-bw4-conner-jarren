//
//  ReviewReceiptViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ReviewReceiptViewController: UIViewController {
    @IBOutlet var receiptPreviewPicture: UIImageView!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var placeOfPurchaseLabel: UILabel!
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    
    var locationString: String = ""
    var dateString: String = ""
    var nameString: String = ""
    var priceString: String = ""
    var quantityString: String = ""
    var categoryString: String = ""
    var descriptionString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        placeOfPurchaseLabel.text = locationString
        dateLabel.text = dateString
        itemNameLabel.text = nameString
        priceLabel.text = priceString
        quantityLabel.text = quantityString
        categoryLabel.text = categoryString
        descriptionTextView.text = descriptionString

    }

}

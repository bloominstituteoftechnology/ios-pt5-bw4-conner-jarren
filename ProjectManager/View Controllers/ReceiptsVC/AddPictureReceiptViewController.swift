//
//  AddPictureReceiptViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class AddPictureReceiptViewController: UIViewController {

    @IBOutlet var receiptPreviewImage: UIImageView!
    
    var locationString: String = ""
    var dateString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addImagePressed(_ sender: Any) {
        
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        #warning("Need to implement to protect seguing without data")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC", let destination = segue.destination as? AddDetailsReceiptViewController {
            destination.locationString = locationString
            destination.dateString = dateString
        }
    }
}

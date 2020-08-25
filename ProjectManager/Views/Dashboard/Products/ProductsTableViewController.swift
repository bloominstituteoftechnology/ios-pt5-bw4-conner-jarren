//
//  ProductsTableViewController.swift
//  ProjectManager
//
//  Created by conner on 8/21/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    let reuseIdentifier = "ProductCell"
    
    var productController = ProductController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let exampleProduct = Product(name: "2x4", purchaseDate: NSDate.now, price: 2.99, quantity: 12)
        productController.addProduct(exampleProduct)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productController.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let productCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ProductTableViewCell {
            productCell.configureViews(for: productController.productAtIndex(indexPath.row))
            cell = productCell
        }
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            productController.removeProductAtIndex(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Set Cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productDetailVC = segue.destination as? ProductDetailViewController {
            if segue.identifier == "ViewProductSegue", let indexPath = tableView.indexPathForSelectedRow {
                productDetailVC.productController = productController
                productDetailVC.productController?.selectedTableViewIndex = indexPath.row
            }
            else if segue.identifier == "AddProductSegue" {
                productDetailVC.productController = productController
                productDetailVC.productController?.selectedTableViewIndex = nil
            }
        }
    }
}

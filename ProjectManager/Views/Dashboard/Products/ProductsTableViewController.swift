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
        self.tableView.separatorStyle = .none
        let exampleProduct = Product(name: "2x4", purchaseDate: NSDate.now, price: 2.99, quantity: 12)
        let exampleProduct2 = Product(name: "TopSoil", price: 5.25, quantity: 8)
        productController.addProduct(exampleProduct)
        productController.addProduct(exampleProduct2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return productController.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    // Make the background color show through spacing
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let productCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ProductTableViewCell {
            productCell.configureViews(for: productController.productAtIndex(indexPath.section))
            cell = productCell
        }
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            productController.removeProductAtIndex(indexPath.section)
            tableView.deleteSections([indexPath.section], with: .fade)
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
                productDetailVC.productController?.selectedTableViewIndex = indexPath.section
            }
            else if segue.identifier == "AddProductSegue" {
                productDetailVC.productController = productController
                productDetailVC.productController?.selectedTableViewIndex = nil
            }
        }
    }
}

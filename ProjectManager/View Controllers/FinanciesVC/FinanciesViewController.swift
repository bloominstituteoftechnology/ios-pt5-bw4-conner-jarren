//
//  FinanciesViewController.swift
//  ProjectManager
//
//  Created by conner on 8/24/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class FinanciesViewController: UIViewController {
    @IBOutlet var pieChart: FinancialPieChart!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalLabel: UILabel!
    
    var financialData: [String:Float] = [:]
    var sortedKeys: [String] = []
    let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue, .systemIndigo, .systemPurple]
    var totalSpending: Float {
        var total: Float = 0
        for amount in financialData.values {
            total += amount
        }
        return total
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        financialData["Materials"] = 250.00
        financialData["Services"] = 150.00
        financialData["Misc"] = 25.00
        financialData["Housing"] = 450.00
        financialData["Gifts"] = 60.00
        financialData["Food"] = 200.00
        financialData["Some Other Category"] = 25.00
        pieChart.drawPieChart(with: financialData)
        sortedKeys = pieChart.sortData(financialData)
        
        totalLabel.text = String(format: "$%.2f", totalSpending)
    }
}

extension FinanciesViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - TableView Stuff
    func numberOfSections(in tableView: UITableView) -> Int {
        return financialData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    // Make the background color show through spacing
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! FinancialTableViewCell
        let category: String = sortedKeys[indexPath.section]
        cell.configureViews(category: category, spending: financialData[category]!, color: colors[indexPath.section % 7])
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategorySegue" {
            
        }
    }
}

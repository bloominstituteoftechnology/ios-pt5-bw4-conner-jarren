//
//  ProfileViewController.swift
//  ProjectManager
//
//  Created by Jarren Campos on 8/25/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var firtNameLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var testCategories: [String] = [
    "Account settings",
    "Support",
    "Legal"
    ]

    #warning("Need to add a second array of icons to match up")
    #warning("Need to create a profile struct and controller")
    
    var accountDetailsArray: [String] = [
    "Personal Information"
    ]
    
    var supportArray: [String] = [
    "Get help",
    "Give us feedback"
    ]
    
    var legalArray: [String] = [
    "Terms of Service",
    "Log out"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func editProfileTapped(_ sender: Any) {
        
    }
    
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
//            header.tintColor = UIColor.lightGray
            header.textLabel?.textColor = UIColor.black
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Account details"
        } else if section == 1 {
            return "Support"
        } else {
            return "Legal"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return accountDetailsArray.count
        } else if section == 1 {
            return supportArray.count
        } else {
            return legalArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        #warning("Change this in the future to hold a title on the left and a matching icon on the right")
        if indexPath.section == 0 {
            cell.textLabel?.text = accountDetailsArray[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = supportArray[indexPath.row]
        } else {
            cell.textLabel?.text = legalArray[indexPath.row]
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 && indexPath.row == 1{
            performSegue(withIdentifier: "undwindToLoginScreen", sender: Any?.self)
        }
    }
}

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

    #warning("Need to add a second array of icons to match up")
    #warning("Need to create a profile struct and controller")
    var testArray: [String] = [
    "Personal Information",
    "Notifications",
    "Get help",
    "Give us feedback",
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        #warning("Change this in the future to hold a title on the left and a matching icon on the right")
        cell.textLabel?.text = testArray[indexPath.row]
        
        return cell
    }
    
    
}

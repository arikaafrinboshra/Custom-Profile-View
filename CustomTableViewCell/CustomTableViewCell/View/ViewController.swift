//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Arika Afrin Boshra on 16/4/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileBtn: UIButton!    //use it as a back button
    @IBOutlet weak var addTaskBtn: UIButton!
    @IBOutlet weak var settingsMenu: UIButton!  //Use for settings in the profile
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userMailLbl: UILabel!
    
    //Variables
    var shouldAnimateCells = true
    let itemName: [String] = [
        "Daily Task",
        "Recent Activity",
        "Comleted Tasks in Time",
        "Deleted Task Item",
        "Upcoming Tasks",
        "On Going Tasks"
    ]
    
    let itemNumber: [String] = [
        "9",
        "3",
        "10",
        "29",
        "54",
        "5"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = 67
        
        profileBtn.addBottomBorderWithColor(color: .white, width: 1)
        
        addTaskBtn.layer.cornerRadius = 25
        addTaskBtn.layer.borderWidth = 1
        addTaskBtn.layer.borderColor = UIColor.systemIndigo.cgColor
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        shouldAnimateCells = false
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.title.text = itemName[indexPath.row]
        cell.titleItems.text = itemNumber[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if shouldAnimateCells, let placeCell = cell as? TableViewCell {
            
            placeCell.render(position: indexPath.row, total: itemName.count)
            placeCell.animate(position: indexPath.row)
        }
    }
}

extension UIView {
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
    }
}


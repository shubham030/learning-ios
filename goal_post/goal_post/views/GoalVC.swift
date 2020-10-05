//
//  GoalVC.swift
//  goal_post
//
//  Created by Shubham Gupta on 03/10/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false

    }
    
    @IBAction func addGoalButtonWasPressed(_ sender:Any){
        print("button was pressed")
    }
    
    
        
}

extension GoalsVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else{
            return UITableViewCell()
        }
        cell.configureCell(description: "Eat salad twice a weak", type: "Short-Term", goalProgressAmount: 2)
        return cell
    }    
}

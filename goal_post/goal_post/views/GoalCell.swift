//
//  GoalCell.swift
//  goal_post
//
//  Created by Shubham Gupta on 02/10/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLabel:UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func configureCell(goal:Goal){
        goalDescriptionLabel.text = goal.goalDescription
        goalTypeLabel.text = goal.goalType
        goalProgressLabel.text = String(describing: goal.goalProgress)
        self.completionView.isHidden = goal.goalCompletionValue != goal.goalProgress
        
    }
}

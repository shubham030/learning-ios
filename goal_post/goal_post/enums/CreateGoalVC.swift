//
//  CreateGoalVC.swift
//  goal_post
//
//  Created by Shubham Gupta on 04/10/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController,UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        nextButton.bindToKeyboard()
        changeGoalType(type: .shortTerm)
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is you goal?"{
            guard  let finishGoalVC = storyboard?.instantiateViewController(identifier: "finishGoalVC") as? FinishGoalVC else {
                return
            }
            finishGoalVC.initData(description: goalTextView.text, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        changeGoalType(type:.shortTerm)
    }
    @IBAction func longTermButtonPressed(_ sender: Any) {
        changeGoalType(type:.longTerm)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
    func changeGoalType(type:GoalType){
        switch type {
        case .shortTerm:
            goalType = .shortTerm
            shortTermButton.setSelectedColor()
            longTermButton.setDelectedColor()
            break
        case .longTerm:
            goalType = .longTerm
            shortTermButton.setDelectedColor()
            longTermButton.setSelectedColor()
            break
            
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    }
}

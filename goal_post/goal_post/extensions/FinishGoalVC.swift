//
//  FinishGoalVC.swift
//  goal_post
//
//  Created by Shubham Gupta on 04/10/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalButton: UIButton!
    
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description:String,type:GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self
        createGoalButton.bindToKeyboard()
    }
    
    
    @IBAction func createGoalPressed(_ sender: Any) {
        if(pointsTextField.text != ""){
            
        self.save {
            complete in
                if (complete){
                    dismiss(animated: true, completion: nil)
                
                }
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool )->()){
        guard  let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
        try managedContext.save()
            completion(true)
            print("completed")
        }
        catch{
            debugPrint("couldnt save \(error.localizedDescription)")
            completion(false)
        }
        
        
    }
}

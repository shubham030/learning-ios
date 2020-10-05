//
//  GoalVC.swift
//  goal_post
//
//  Created by Shubham Gupta on 03/10/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    @IBOutlet weak var goalRemovedView: UIView!
    
    var goals :[Goal] = []
    var lastRemovedGoal:Goal?
    var lastRemovedIndexPath:IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        goalRemovedView.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    @IBAction func addGoalButtonWasPressed(_ sender:Any){
        guard  let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {
            return
        }
        presentDetail(createGoalVC)
    }
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        self.undoDeletedGoal(goal:lastRemovedGoal!)
        goalRemovedView.isHidden = true
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    
    func fetchCoreDataObjects(){
        self.fetch{(complete) in
           if complete {
               if goals.count >= 1{
                   tableView.isHidden = false
               }else{
                    tableView.isHidden = true
                   }
               }
           }
        
    }
}

extension GoalsVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell {
            let goal = goals[indexPath.row]
            cell.configureCell(goal:goal)
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "DELETE"){
            (_,_,_) in
            self.lastRemovedGoal = self.goals[indexPath.row]
            self.removeGoal(atIndexPath: indexPath)
            
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.goalRemovedView.isHidden = false
        }
        
        let addAction = UIContextualAction(style: .normal, title: "ADD 1"){
            (_,_,_) in self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        addAction.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        deleteAction.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction,addAction])
        return swipeActions
    }
}

extension GoalsVC{
    
    func undoDeletedGoal(goal:Goal){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return
        }
        print(goal.description)
        let lastGoal = Goal(context:managedContext)
        lastGoal.goalDescription = goal.goalDescription
        lastGoal.goalType = goal.goalType
        lastGoal.goalCompletionValue = goal.goalCompletionValue
        lastGoal.goalProgress = goal.goalProgress
        do{
            try managedContext.save()
            print("undo successful")
        }catch{
            debugPrint("couldnt undo \(error.localizedDescription)")
        }
    }
    
    func setProgress(atIndexPath indexPath:IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return
        }
        
        let choosenGoal = goals[indexPath.row]
        if choosenGoal.goalProgress < choosenGoal.goalCompletionValue {
            choosenGoal.goalProgress += 1
        }else{
            return
        }
        
        do{
            try managedContext.save()
            print("progress updated successfully")
        }catch{
            debugPrint("couldnt update progress \(error.localizedDescription)")
        }
    }
    
    func removeGoal(atIndexPath indexPath:IndexPath){
        let goalToBeRemoved:Goal = goals[indexPath.row]
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return
        }
        managedContext.delete(goalToBeRemoved)
        do{
            try managedContext.save()
            print("removed successfully")
        }catch{
            debugPrint("couldnt remove \(error.localizedDescription)")
        }
    }
    
    func fetch(completion:(_ complete:Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return
        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Goal")
        do{
            goals = try managedContext.fetch(fetchRequest) as! [Goal]
            print("success")
            completion(true)
        }catch{
            debugPrint("Couldnt fetch \(error.localizedDescription)")
            completion(false)
        }
    }
}

//
//  yourPredictions.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 3/26/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//

import UIKit
import CoreData

class yourPredictions: UIViewController {
    
    var goaledValues : String? = ""
    var doneValues : String? = ""
    var resultsValues : String? = ""
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    var arrayStats = [Statistics]()
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func saveBTN(_ sender: Any) {
       //needs code to save data
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        
        
        let stats = UserDefaults.standard.object(forKey: "resultsKEY") as? [Int] ?? [Int]()
        
        print("FROM YOUR PREDICTIONS VALUES")
        print(goaledValues)
        print(doneValues)
        print(resultsValues)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   
    
}



extension yourPredictions: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Creates object to make cells in the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell") as! ResultsCell
        // Iterates days array to display day by index
        let weekDays = days[indexPath.row]
        //Condition to check row number and place values on first row only, else on next row values have to be passed through calculator fucntion
        if indexPath.row == 0 {
            //Assigning values to the first row of the table only
            //Assigning values to Done and Results labels in the Table
            cell.dayLabel?.text = weekDays
            cell.goaledLabel?.text = goaledValues
            cell.doneLabel?.text = doneValues
            cell.resultsLabel?.text = resultsValues
        }else if indexPath.row == 1 {
           print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>calling calculator function")
           // performanceCalculator()
//          Placing values on Tuesday row, the goal value is already calculated
//          At this point data has to be saved to be used in next day calculations
            cell.dayLabel?.text = weekDays
            cell.goaledLabel?.text = String("pending")
            cell.doneLabel?.text = String("pending")
            cell.resultsLabel?.text = String("pending")
        }else if indexPath.row == 2 {
            cell.dayLabel?.text = weekDays
            cell.goaledLabel?.text = String("pending")
            cell.doneLabel?.text = String("pending")
            cell.resultsLabel?.text = String("pending")
        }else if indexPath.row == 3 {
            cell.dayLabel?.text = weekDays
            cell.goaledLabel?.text = String("pending")
            cell.doneLabel?.text = String("pending")
            cell.resultsLabel?.text = String("pending")
        }else if indexPath.row == 4 {
            cell.dayLabel?.text = weekDays
            cell.goaledLabel?.text = String("pending")
            cell.doneLabel?.text = String("pending")
            cell.resultsLabel?.text = String("pending")
        }
        return cell
    }
}

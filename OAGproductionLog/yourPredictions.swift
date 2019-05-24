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
    
    var goaledValues : Int16?
    var doneValues : Int16?
    var resultsValues : Int16?
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    var arrayStats = [Statistics]()
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func saveBTN(_ sender: Any) {
       //needs code to save data
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
         savingData()

        
        // getting values from Statistics Class where we saved previously
        let fetchRequest: NSFetchRequest<Statistics> = Statistics.fetchRequest()
        
        do {
            let arrayStats = try PersistenceService.context.fetch(fetchRequest)
            self.arrayStats = arrayStats
            self.tableView.reloadData()
        } catch {
            print("Soemthing went wrong when trying to get values from the PersistenceService function")
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
    }
    
    func savingData() {
        //populating new array with values from Statistics class
        let dataStats = Statistics(context: PersistenceService.context)
        //If statement to prevent unwrapping error
        if (dataStats == nil){
            dataStats.goal = goaledValues!
            dataStats.done = doneValues!
            dataStats.results = resultsValues!
            PersistenceService.saveContext()
            self.arrayStats.append(dataStats)
            self.tableView.reloadData()
        }
    }
    
//    func performanceCalculator(){
//        
//        var goaled = 0
//        var done = 0
//        var results = 0
//        let number:Int? = goaled
//        
//        if number == nil {
//            let intDoneValues = Int(inputdayCases!)! //This line is presenting a fatal error
//            let intGoaledValues = Int(goaledtodayCases)!
//            
//            results = intDoneValues - intGoaledValues
//            
//            if(results > 0){
//                goaled = intGoaledValues - results
//                results = 0
//            }else {print("############ no  data here #############")}
//            
//        }
//    }

    
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
        //While loo to populate table view
        var ctr = days.count
        print(ctr)
        while indexPath.row <= ctr {
            //Assigning values to the first row of the table only
            //Assigning values to Done and Results labels in the Table
            cell.dayLabel?.text = weekDays
            cell.goaledLabel?.text = String(arrayStats[indexPath.row].goal)
            cell.doneLabel?.text = String(arrayStats[indexPath.row].done)
            cell.resultsLabel?.text = String(arrayStats[indexPath.row].results)
            ctr-=1
            print("The counter:, \(ctr)")
        }
        return cell
    }
}

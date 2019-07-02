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
    
//    var dayName : String?
//    var goaledValues : Int16?
//    var doneValues : Int16?
//    var resultsValues : Int16?
//    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var arrayStats = [Statistics]()
    var inputTotalsVals = Statistics(context: PersistenceService.context)
    
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func saveBTN(_ sender: Any) {
       
        //savingData()
        print(inputTotalsVals)
        print("SAVED BUTTON PRESSED")
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        let date = Date()
        let myCalendar = Calendar(identifier: .gregorian)
        let today = myCalendar.component(.weekday, from: date)
       // print(days[today-1])
        
        print("&&&&&&&&&&&&&&&&&&")
        print("Reloading table")

        // getting values from Statistics Class where we saved previously
        let fetchRequest: NSFetchRequest<Statistics> = Statistics.fetchRequest()
        
        do {
            let arrayStats = try PersistenceService.context.fetch(fetchRequest)
            self.arrayStats = arrayStats
           // self.tableView.reloadData()
        } catch {
            print("Soemthing went wrong when trying to get values from the PersistenceService function")
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    
    
//    @objc func loadList(notification: NSNotification){
//        //load data here
//        self.tableView.reloadData()
//    }
    
//    func savingData() {
//        //populating new array with values from Statistics class
//         let dataStats = Statistics(context: PersistenceService.context)
//        //If statement to prevent unwrapping error
//        if (dataStats == nil){
//            dataStats.goal = goaledValues!
//            dataStats.done = doneValues!
//            dataStats.results = resultsValues!
//            PersistenceService.saveContext()
//            self.arrayStats.append(dataStats)
//            self.tableView.reloadData()
//        }
//    }
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return arrayStats.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(arrayStats.count)
        //Creates object to make cells in the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell") as! ResultsCell
      
            //Assigning values to the first row of the table only
            //Assigning values to Done and Results labels in the Table
            //cell.dayLabel?.text = days[indexPath.row]
            cell.dayLabel?.text = arrayStats[indexPath.row].day
            cell.goaledLabel?.text = String(arrayStats[indexPath.row].goal)
            cell.doneLabel?.text = String(arrayStats[indexPath.row].done)
            cell.resultsLabel?.text = String(arrayStats[indexPath.row].results)
        
       return cell
    }
}

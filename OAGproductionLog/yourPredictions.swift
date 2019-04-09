//
//  yourPredictions.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 3/26/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//

import UIKit

class yourPredictions: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var goaledValues : String? = ""
    var doneValues : String? = ""
    var resultsValues : String? = ""
    
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        print(goaledValues as Any)
        print(doneValues as Any)
        print(resultsValues as Any)
       
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension yourPredictions: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //statement to convert goaledValues to String. Commented out for now!
        // let goaledVal:String! = goaledValues
    print(goaledValues as Any)
    print(doneValues as Any)
    print(resultsValues as Any)
    
        let weekDays = days[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell") as! ResultsCell
    
        func calculator(){
            if let x = doneValues, let text = doneValues {
                print ("\(x), \(text)")
                var goaled = 0
                var done = 0
                var results = 0
                
                let intDoneValues = Int(doneValues!)!
                let intGoaledValues = Int(goaledValues!)!
                
                results = intDoneValues - intGoaledValues
                if(results > 0){
                    goaled = intGoaledValues - results
                    results = 0
                }
                
                cell.goaledLabel.text = String(goaled)
                cell.doneLabel.text = String(done)
                cell.resultsLabel.text = String(results)
            }
            
        }
    
        cell.dayLabel.text = weekDays
        cell.goaledLabel.text = goaledValues
        //Assigning values to the rirst row only
        if indexPath.row == 0 {
            cell.doneLabel.text = doneValues
            cell.resultsLabel.text = resultsValues
        }else if indexPath.row == 1 {
           calculator()
        }
    
        return cell
    }
    
    
    
}

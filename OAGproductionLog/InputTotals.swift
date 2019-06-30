//
//  InputTotals.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 3/13/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//

import UIKit
import CoreData
class InputTotals: UIViewController {
    
    @IBOutlet weak var inputDaycases: UITextField!
    @IBOutlet weak var goalCasesLabel: UILabel!
    @IBOutlet weak var casesResults: UILabel!
    
    // variable for UITextField use
    var inputdayCases : String!
    
    // variable to place incoming values from the goal daycases viewcontrollers
    var goaledtodayCases = ""
    var casesResultsData = ""
    
    // variable to store results in core
    var resultsARRAY = [Statistics]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalCasesLabel.text = goaledtodayCases
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        // Getting the value from UITextField into the variable
        inputdayCases = inputDaycases?.text
        
        // Convert value to Int and use it for calculations. Calculating the difference from cases done and goaled cases
        let results = Int(goaledtodayCases)! - Int(inputdayCases)!
       
        // Conditioners for Alerts to determine if goal was reached or for how much was off
        if Int(goaledtodayCases)! < Int(inputdayCases)! {
            let alert = UIAlertController(title: "Today's Results", message: "You exceeded your \(goaledtodayCases) cases goal by: \(abs(results)) cases Congratulations!", preferredStyle: .alert)
                self.present(alert, animated: true)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {
               action in self.performSegue(withIdentifier: "yourPredictions", sender: self)
                
                self.savingValues()
                print("PRINTING ARRAY RESULTS in ALERT:")
                print(self.resultsARRAY)
                print("################# Data SAVED and Sent to Your PredictionsVC ################")
            }))
        }else if Int(goaledtodayCases)! >= Int(inputdayCases)! {
            
            print("Today you were off by: \(abs(results)) from your goal of: \(goaledtodayCases) cases")
            let alert = UIAlertController(title: "Today's Results", message: "You were off by: \(abs(results)) from your goal of: \(goaledtodayCases) cases", preferredStyle: .alert)
            self.present(alert, animated: true)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in self.performSegue(withIdentifier: "yourPredictions", sender: self)
                self.savingValues()
                print("################# Data SAVED and Sent to Your PredictionsVC ################")
            }))
        }
        //storing result inside variable as a String
        casesResultsData = String(abs(results))
    }
    
    
    func savingValues() {
        let statistics = Statistics(context: PersistenceService.context)
        statistics.goal = Int16(goaledtodayCases)!
        statistics.done = Int16(inputdayCases)!
        statistics.results = Int16(casesResultsData)!
        PersistenceService.saveContext()
        self.resultsARRAY.append(statistics)
        //yourPredictions.tableView.reloadData() //At this point the table has to be reloaded but my table is in another VC
        print("PRINTING ARRAY RESULTS:")
        print(resultsARRAY)
    }
    
    //override function to send data to another View Controller via segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){

    //sending values to yourPredictions screen label
    let destVCyourPredictions = segue.destination as! yourPredictions
        
        destVCyourPredictions.arrayStats = resultsARRAY
       
//        destVCyouPredictions.goaledValues = Statistics.goal
//        destVCyouPredictions.doneValues = statistics.done
//        destVCyouPredictions.resultsValues = statistics.results
    }
}

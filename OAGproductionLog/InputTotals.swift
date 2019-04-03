//
//  InputTotals.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 3/13/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//

import UIKit

class InputTotals: UIViewController {
    
    @IBOutlet weak var inputDaycases: UITextField!
    @IBOutlet weak var goalCasesLabel: UILabel!
    @IBOutlet weak var casesResults: UILabel!
    
    // variable for UITextField use
    var inputdayCases : String!
    
    // variable to place incoming values from the goal daycases viewcontrollers
    var goaledtodayCases = ""
    var casesResultsData = ""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalCasesLabel.text = goaledtodayCases
        casesResults.text = casesResultsData
        
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        // Getting the value from UITextField into the variable
        inputdayCases = inputDaycases.text
        
       
        // Convert value to Int and use it for calculations. Calculating the difference from cases done and goaled cases
        let results = Int(goaledtodayCases)! - Int(inputdayCases)!
       
        // Conditioners for Alerts to determine if goal was reached or for how much was off
        if Int(goaledtodayCases)! < Int(inputdayCases)! {
            let alert = UIAlertController(title: "Today's Results", message: "You exceeded your \(goaledtodayCases) cases goal by: \(abs(results)) cases Congratulations!", preferredStyle: .alert)
                self.present(alert, animated: true)
            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {action in self.performSegue(withIdentifier: "yourPredictions", sender: self)}))
        }else if Int(goaledtodayCases)! >= Int(inputdayCases)! {
            
            print("Today you were off by: \(abs(results)) from your goal of: \(goaledtodayCases) cases")
            let alert = UIAlertController(title: "Today's Results", message: "You were off by: \(abs(results)) from your goal of: \(goaledtodayCases) cases", preferredStyle: .alert)
            self.present(alert, animated: true)
            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: nil))
        }
        //storing result inside variable
        casesResultsData = String(abs(results))
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    
        //sending values to yourPredictions screen label
        let destVCyouPredictions = segue.destination as! yourPredictions
        
        destVCyouPredictions.goaledValues = goaledtodayCases
        destVCyouPredictions.doneValues = inputdayCases
        destVCyouPredictions.resultsValues = casesResultsData
        
    }
    
}

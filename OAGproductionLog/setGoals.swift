//
//  setGoals.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 3/12/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//

import UIKit

class setGoals: UIViewController {

    @IBOutlet weak var dayGoalText: UITextField!
    @IBOutlet weak var weekGoalText: UITextField!
    @IBOutlet weak var monthGoalText: UITextField!
    
    
    var DailyValue : String!
    var WeeklyValue : String!
    var MonthlyValue : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Button function for setDaily value
    @IBAction func setDailyGoalButton(_ sender: Any) {
        
        
        DailyValue = dayGoalText.text
        WeeklyValue = weekGoalText.text
        MonthlyValue = monthGoalText.text
        performSegue(withIdentifier: "toGoals", sender: nil)
    }
    
  
    //Passing Data from set goals to Goals and InputTotals Scene labels
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //Sending values to goals screen labels
        let destVC = segue.destination as! Goals
        
        destVC.dayValues = DailyValue
        destVC.weekValues = WeeklyValue
        destVC.monthValues = MonthlyValue
        
   
    }
}

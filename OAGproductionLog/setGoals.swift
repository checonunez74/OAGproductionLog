//
//  setGoals.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 3/12/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//

import UIKit


class setGoals: UIViewController {

    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var dayGoalText: UITextField!
    @IBOutlet weak var weekGoalText: UITextField!
    @IBOutlet weak var monthGoalText: UITextField!
    
    var DayName : String!
    var DailyValue : String!
    var WeeklyValue : String!
    var MonthlyValue : String!
    
    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var dayNameHolder = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayNameLabel?.text = dayName()
       
        
    }
    
    func dayName() -> String {
        let date = Date()
        let myCalendar = Calendar(identifier: .gregorian)
        let today = myCalendar.component(.weekday, from: date)
        print(days[today-1])
        dayNameHolder = days[today-1]
        
        return dayNameHolder
    }
    
    //Button function for setDaily value
    @IBAction func setDailyGoalButton(_ sender: Any) {
        
        DayName = dayNameHolder
        DailyValue = dayGoalText.text
        WeeklyValue = weekGoalText.text
        MonthlyValue = monthGoalText.text
        performSegue(withIdentifier: "toGoals", sender: nil)
        
    }
    
  
    //Passing Data from setGoals to Goals and InputTotals Scene labels
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //Sending values to goals screen labels
        let destVC = segue.destination as! Goals
        
        destVC.dayName = DayName
        destVC.dayValues = DailyValue
        destVC.weekValues = WeeklyValue
        destVC.monthValues = MonthlyValue
        
    }
}

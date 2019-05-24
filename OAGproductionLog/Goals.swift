//
//  Goals.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 3/12/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//

import UIKit

class Goals: UIViewController {
    
   
    @IBOutlet weak var dataPassedLabel: UILabel!
    @IBOutlet weak var dataPassedLabel2: UILabel!
    @IBOutlet weak var dataPassedLabel3: UILabel!
    
    // variables to place values coming from setGoals viewcontroller
    var dayValues = ""
    var weekValues = ""
    var monthValues = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataPassedLabel?.text = dayValues
        dataPassedLabel2?.text = weekValues
        dataPassedLabel3?.text = monthValues
       
    }
    //Function to change to another view Controller 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //sending values to input totals screen label
        let destVCinputTotals = segue.destination as! InputTotals
        destVCinputTotals.goaledtodayCases = dayValues
       
    }
    
}

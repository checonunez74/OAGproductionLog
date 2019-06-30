//
//  OAG_productionLog.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 3/12/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//

import UIKit

class OAG_productionLog: UIViewController {
    @IBOutlet weak var inputTotalsLabel: UIButton!
    @IBOutlet weak var checkPredictionsLabel: UIButton!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        inputTotalsLabel.isEnabled = false
        checkPredictionsLabel.isEnabled = false
        
    }
    
    @IBAction func setGoalsBTN(_ sender: Any) {
       
        inputTotalsLabel.isEnabled = true
        checkPredictionsLabel.isEnabled = true
    }
    

}

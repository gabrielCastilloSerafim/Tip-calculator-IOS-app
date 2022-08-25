//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Gabriel Castillo Serafim on 24/8/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    
    var value:Float = 0
    var calcInstructions = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", value)
        explanationLabel.text = calcInstructions
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}

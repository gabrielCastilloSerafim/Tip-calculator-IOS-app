//
//  Model.swift
//  Tipsy
//
//  Created by Gabriel Castillo Serafim on 24/8/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    
    var totalPerPerson:Float = 0
    var calculationExplained:String = ""
    
    mutating func performCalculation(numberInputted:Float, percentageSelected:Float, peopleToSplit:Float) {
        //Calcula numero
        totalPerPerson = numberInputted / peopleToSplit + (numberInputted * percentageSelected / peopleToSplit)
        
        //Cria instruções
        let peopleNumber = String(format: "%.0f", peopleToSplit)
        let percentage = String(format: "%.0f", percentageSelected*100)
        
        calculationExplained = "Split between \(peopleNumber) people, with \(percentage)% tip."
    }
    
}

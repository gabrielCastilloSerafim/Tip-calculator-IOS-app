//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    var calculatorBrain = CalculatorBrain()
    
    var percentageSelected:Float = 0.1
    
    @IBAction func percentageChanged(_ sender: UIButton) {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        
        //DismissKeyboard
        textInput.endEditing(true)
        
        percentageSelected = Float(sender.tag)/100
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //Capturar o valor do numero introduzido
        let numberInputted = Float(textInput.text ?? "0")
        
        //Capturar valor do numero de pessoas a dividir
        let peopleToSplit = Float(splitNumberLabel.text!)
        
        calculatorBrain.performCalculation(numberInputted: numberInputted ?? 0, percentageSelected: percentageSelected, peopleToSplit: peopleToSplit!)
        
        self.performSegue(withIdentifier: "goToResultPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResultPage" {
            let nextPage = segue.destination as! ResultViewController
            
            nextPage.value = calculatorBrain.totalPerPerson
            nextPage.calcInstructions = calculatorBrain.calculationExplained
        }
    }
    
}


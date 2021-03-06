//
//  ViewController.swift
//  AdvancedCalculator
//
//  Created by Khaled Mohab on 3/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var displayNum = ""
    private var calculator = CalculatorModel()
    private var stoppedEditing : Bool = true
    
    private var displayNumber: Double{
        get{
            guard let number = Double(displayLabel.text!)
            else{
                fatalError("Can't convert to double")
            }
            return number
        }
        set(newValue){
            displayLabel.text = String(newValue)
        }
    }
    @IBAction func calcBtnPressed(_ sender: UIButton) {
        
        stoppedEditing = true
        if let oper = sender.currentTitle{
            displayNumber = calculator.calculate(oper: oper, displayNumber: displayNumber) ?? 0
        }
    }
    
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        if stoppedEditing{
            if let numPressed = sender.currentTitle{
                self.displayLabel.text = numPressed
                stoppedEditing = false
            }
        }else{
            if sender.currentTitle == "."{
                
                let isInt = floor(displayNumber) == displayNumber
                if !isInt{
                    return
                }
            }
            if let numPressed = sender.currentTitle{
                self.displayLabel.text = self.displayLabel.text! + numPressed
                
            }
        }
        
        
        
    }


override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
}


}


//
//  calculatorModel.swift
//  AdvancedCalculator
//
//  Created by Khaled Mohab on 3/2/21.
//

import Foundation

struct CalculatorModel{
    private var calculations : (number: Double, oper: String)?
    
    mutating func calculate(oper:String, displayNumber:Double) -> Double? {
            switch oper {
            case "+/-":
                return displayNumber * -1
            case "%":
                return displayNumber / 100
            case "AC":
                return 0
            case "÷":
                self.calculations = (number:displayNumber,oper:"/")
                return 0
            case "×":
                self.calculations = (number:displayNumber,oper:"*")
                return 0
            case "=":
                if let cal = calculations{
                    let exp: NSExpression = NSExpression(format: String(cal.number)+cal.oper+String(displayNumber))
                    let result: Double = exp.expressionValue(with:nil, context: nil) as! Double
                    return result
                }
                return displayNumber
            default:
                self.calculations = (number:displayNumber,oper:oper)
                return 0
        }
        
//        if oper== "="{
//
//            if let mInt = Int(displayNum) {
//                print("Your string is integer.\(mInt)")
//
//            }else if let mFloat = Float(displayNum) {
//                print("Your string is float.\(mFloat)")
//            }
//            else {
//                print("Your string is not integer")
//            }
//
//        }

    }

}

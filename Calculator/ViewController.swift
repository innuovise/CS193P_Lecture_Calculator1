//
//  ViewController.swift
//  Calculator
//
//  Created by SK on 3/12/17.
//  Copyright © 2017 SK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // instance variables are properties in swift
    // optionals are automatically set to nil
    // nil means not set
    @IBOutlet weak var display: UILabel!
    
    // var must be initialized
    var userIsInTheMiddleOfTyping = false
    
    // _ sender means no external
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping
        {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else
        {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
        
        //print("\(digit) was touched")
    }
    
    var displayValue: Double
    {
        get
        {
            return Double(display.text!)!
        }

        set
        {
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        userIsInTheMiddleOfTyping = false
        
        if let mathematicalSymbol = sender.currentTitle
        {
            switch mathematicalSymbol
            {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
        
    }
    
    
//    func drawHorizontalLine(from startX: Double, to endX: Double, using color: UIColor)
//    {
//        distance = endX - startX
//    }
//    
//    drawHorizontalLine(from: 5.0, to: 8.5, using: UIColor.blue)
    
}


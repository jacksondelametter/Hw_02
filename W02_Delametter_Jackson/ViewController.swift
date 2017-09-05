//
//  ViewController.swift
//  W02_Delametter_Jackson
//
//  Created by Jackson Delametter on 8/31/17.
//  Copyright © 2017 Jackson Delametter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // View
    @IBOutlet weak var numberView: UITextField!
    
    // Member variables
    private var hasDecimal = false      // Does numberView have a decimal
    
    // Static variables
    private static let ZERO = "0"
    private static let DECIMAL = "."
    private static let CLEAR = "C"
    private static let FLUID_OUNCE = "OZ"
    private static let MILLILITER = "MI"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonAction(_ sender: UIButton) {
        let buttonText: String! = sender.titleLabel?.text
        if isDigit(buttonText){
            // The button pressed is a digit
            digitPressed(Digit: buttonText)
        }
        else if buttonText == ViewController.DECIMAL {
            // The decimal button has been pressed
            decimalPressed()
        }
        else if buttonText == ViewController.CLEAR {
            // The clear button was pressed
            clearPressed()
        }
        else if buttonText == ViewController.MILLILITER {
            // The milliliter button was pressed
            milliliterPressed()
        }
        else if buttonText == ViewController.FLUID_OUNCE {
            // The fluid ounce button was pressed
            fluidOuncePressed()
        }
    }
    
    private func digitPressed(Digit digit: String) {
        // A digit was pressed
        let numberViewNumber: String! = numberView.text!
        if numberViewNumber == ViewController.ZERO {
            // 0 is entered in the numberView
            numberView.text = digit
        }
        else {
            numberView.text = numberViewNumber + digit
        }
    }
    
    private func decimalPressed() {
        // The decimal button was pressed
        let numberViewNumber: String! = numberView.text!
        if !hasDecimal {
            // If a decimal has not been entered, add one
            numberView.text = numberViewNumber + ViewController.DECIMAL
            hasDecimal = true;
        }

    }
    
    private func clearPressed() {
        // The clear button was pressed
        numberView.text = ViewController.ZERO
        hasDecimal = false

    }
    
    private func milliliterPressed() {
        // The milliliter button was pressed
        if let numberViewValue = Double(numberView.text!) {
            numberView.text = String(numberViewValue / 0.033814)
        }
    }
    
    private func fluidOuncePressed(){
        // The fluid ounce button was pressed
        if let numberViewValue = Double(numberView.text!) {
            let calculatedValue = String(numberViewValue * 0.033814);
            checkForDecimal(calculatedValue)
            numberView.text = String(numberViewValue * 0.033814)
        }
    }
    
    private func checkForDecimal(_ value: String) {
        // Determines if there is a decimal in the output
        for char in value.characters {
            if String(char) == ViewController.DECIMAL {
                hasDecimal = true
                return
            }
        }
        hasDecimal = false
    }
    
    private func isDigit(_ text: String) -> Bool{
        // Determines if a string is a digit
        if let digit = Int(text) {
            for i in 0...9 {
                if digit == i {
                    return true
                }
            }
        }
        return false
    }
    
}


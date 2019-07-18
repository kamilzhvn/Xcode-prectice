//
//  ViewController.swift
//  calculator
//
//  Created by macbook on 6/26/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnLabel: Double = 0
    var previousNumber : Double = 0
    var performingMath = false
    var operation = 0;
    var dotIsPressed = false
    
    @IBOutlet var label: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        if performingMath == true {
            
            label.text = String(sender.tag)
            
            numberOnLabel = Double(label.text!)!
            
            performingMath = false
            
        }
            
        else {
            
            label.text = label.text! + String(sender.tag)
            
            numberOnLabel = Double(label.text!)!
            
        }
    }
    
    @IBAction func buttonsMath(_ sender: UIButton) {
        dotIsPressed = false
        if label.text != "" && sender.tag != 11 && sender.tag != 18 {
        
            previousNumber = Double(label.text!)!
            
//            if sender.tag == 15 { //Divide
//
//                label.text = "/";
//
//
//            }
//
//            if sender.tag == 14 { //Multiply
//
//                label.text = "x";
//
//            }
//
//            if sender.tag == 13 { //Subtract
//
//                label.text = "-";
//
//            }
//
//            if sender.tag == 12 { //Add
//
//                label.text = "+";
//
//            }
            
            operation = sender.tag
            
            performingMath = true;
            
        }
            
        else if sender.tag == 11 {
            var text : String = ""
            
            if operation == 16 { //Divide on 100
                
                text = String(previousNumber / 100)
                
            }
            
            else if operation == 15{ //Divide
                
                text = String(previousNumber / numberOnLabel)
                
            }
                
            else if operation == 14{ //Multiply
                
                text = String(previousNumber * numberOnLabel)
                
            }
                
            else if operation == 13{ //Subtract
                
                text = String(previousNumber - numberOnLabel)
                
            }
                
            else if operation == 12{ //Add
                
                text = String(previousNumber + numberOnLabel)
                
            }
            let field = Double(text)!
            if field.truncatingRemainder(dividingBy: 1)  != 0{ //check if it is double
                dotIsPressed = true
                label.text = String(field)
                print("the outcome is double")
            } else {
                
                dotIsPressed = false
                label.text = String(Int(field))
                print("the outcome is integer")
                
            }
        }
            
        else if sender.tag == 18{ //reset button
            
            label.text = ""
            
            previousNumber = 0
            
            numberOnLabel = 0
            
            operation = 0
            
            
        }
        
    }
    
    
    
    @IBAction func plusMinus(_ sender: UIButton){
        
        if label.text != "" {
            var textnum = Double(label.text!)!
            if textnum != 0 {
                textnum = textnum * (-1)
                label.text = String(textnum)
            }
            performingMath = true
        }
       
        
    }
    @IBAction func dot(_ sender: UIButton) {
        
        if dotIsPressed == false  {
            
            label.text = label.text! + "."
            dotIsPressed = true
            
        } else {
            label.text = label.text! + ""
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}




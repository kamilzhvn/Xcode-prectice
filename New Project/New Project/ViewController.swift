
//
//  ViewController.swift
//  New Project
//
//  Created by macbook on 17.06.19.
//  Copyright (c) 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func ButtonClicked(sender: AnyObject) {
       
        if let age = textField.text {
            let a:Int? = textField.text.toInt()
            let x = a! * 7

            Label.text = "Your cat is " + String(x) + " in cat years"
    
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("hello!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



//
//  ViewController.swift
//  Whats my number
//
//  Created by macbook on 6/20/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    
    @IBAction func save(_ sender: Any) {
        UserDefaults.standard.set(numberField.text, forKey:"number")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let numberObject = UserDefaults.standard.object(forKey: "number")
        if let number=numberObject as? String{
            numberField.text = number
        }
    }
    


}


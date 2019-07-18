//
//  ViewController.swift
//  game_finger
//
//  Created by macbook on 18.06.19.
//  Copyright (c) 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
   
    @IBAction func buttonClicked(sender: AnyObject) {
        let random=String(arc4random_uniform(6))
        
            if textField.text==random{
                label.text="You are right"
            }else{
                label.text="You are wrong! The right was \(random) ."
            }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


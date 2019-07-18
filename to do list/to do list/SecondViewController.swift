//
//  SecondViewController.swift
//  to do list
//
//  Created by macbook on 6/21/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var textFild: UITextField!
    @IBAction func Add(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        
        if let tempItems=itemsObject as? [String]{
            items=tempItems
            
            items.append(textFild.text!)
//
//            items.addObjects(from: [ textFild.text!])
//
        } else{
            
            items = [ textFild.text! ]
        }
        UserDefaults.standard.set(items, forKey:"items")
        textFild.text = " "
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


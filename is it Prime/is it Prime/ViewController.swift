//
//  ViewController.swift
//  is it Prime
//
//  Created by macbook on 19.06.19.
//  Copyright (c) 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var timer = Timer()
    @IBAction func CameraClicked(sender: AnyObject) {
        print("Camera pressed")
        timer.invalidate()
    }
    
    @objc func processTimer(){
        print("A second has passed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(processTimer), userInfo:nil, repeats:true )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


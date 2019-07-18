//
//  ViewController.swift
//  animation gif
//
//  Created by macbook on 6/25/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func fadein(_ sender: Any) {
        image1.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image1.alpha = 1
        })
    }
    @IBAction func slidein(_ sender: Any) {
        image1.center = CGPoint(x: image1.center.x - 500, y: image1.center.y)
        UIView.animate(withDuration:2){
            self.image1.center = CGPoint(x: self.image1.center.x + 500, y: self.image1.center.y)
        }
        
    }
    @IBAction func grow(_ sender: Any) {
    }
    @IBOutlet var image1: UIImageView!
    
    var timer=Timer()
    
    var counter = 2
    
    var isAnimating = false
    
    @objc func animate (){
        image1.image = UIImage(named: "image_\(counter).jpg")
        counter += 1
        if counter == 4{
            counter = 1
        }
        
    }
    
    
    @IBAction func next(_ sender: AnyObject) {
        if isAnimating {
            timer.invalidate()
            
            sender.setTitle("Start animation", for: [])
            
            isAnimating = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.8, target: self , selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            sender.setTitle("Stop animation", for: [])
            
            isAnimating = true
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


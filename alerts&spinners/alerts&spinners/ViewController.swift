//
//  ViewController.swift
//  alerts&spinners
//
//  Created by macbook on 7/9/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlert(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Hey there!", message: "Are you sure?", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            print ("OK button is pressed")
            self.dismiss(animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in
            print ("No button is pressed")
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    @IBAction func pauseApp(_ sender: Any) {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


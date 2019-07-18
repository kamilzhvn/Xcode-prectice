//
//  ViewController.swift
//  Downloading images from Web
//
//  Created by macbook on 7/5/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(fileURLWithPath: "https://commons.wikimedia.org/wiki/File:Johann_Sebastian_Bach.jpg")
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
                if error != nil {
                    print (error)
                } else {
                    if let data = data {
                        if let bachImage = UIImage(data: data){
                            self.imageView.image = bachImage
                            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        }
                    }
                    
                }
        }
    }


}


//
//  ViewController.swift
//  Time Tables
//
//  Created by macbook on 6/20/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderChanged(_ sender: Any) {
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier:"Cell")
        cell.textLabel?.text = String(Int(slider.value * 20) * (indexPath.row + 1))
        return cell
    }

   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


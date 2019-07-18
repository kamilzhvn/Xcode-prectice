//
//  ViewController.swift
//  advanced segues
//
//  Created by macbook on 7/1/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
let globalVariable = "Kamil"
 
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var activeRow = 0
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Row \(indexPath)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        activeRow = indexPath.row
        
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController"{
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.activeRow = activeRow
        }
    }

}


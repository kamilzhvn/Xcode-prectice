//
//  ViewController.swift
//  Core Data Demo
//
//  Created by macbook on 7/3/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var isLoggedIn = false
    
    @IBOutlet var logout: UIButton!
    @IBAction func logoutButton(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    context.delete(result)
                    do {
                        try context.save()
                    } catch {
                        print ("Individual delete failed")
                    }
                    
                }
                
                
                label.alpha = 0
                
                login.alpha = 1
                
                login.setTitle("Login", for: [])
                
                logout.alpha = 0
                
                isLoggedIn = false
                
                textField.alpha = 1
            }
            
        } catch {
            print ("Delete failed")
        }
        
        
    }
    @IBOutlet var login: UIButton!
    
    @IBAction func loginButton(_ sender: AnyObject) {
        
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        if isLoggedIn {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            request.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(request)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        result.setValue(textField.text, forKey: "username")
                        do {
                            
                            try context.save()
                            
                        } catch {
                            print ("Update username  save failed")
                        }

                    }
                    label.text = "Hi there \(textField.text!) !"
                    textField.alpha = 1
                    
                    login.setTitle("Update username", for: [])
                    label.alpha = 1
                    label.text = "Hi there \(textField.text!) !"
                    logout.alpha = 1
                    
                }
            } catch {
                print ("Update username failed")
            }
            
        } else {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            newUser.setValue(textField.text, forKey: "username")
            do {
                try context.save()
                textField.alpha = 0
                login.setTitle("Update username", for: [])
                label.alpha = 1
                label.text = "Hi there \(textField.text!) !"
                logout.alpha = 1
                
                
                isLoggedIn = true
                
            } catch {
                print ("Failed to save")
            }

        }
        
    }
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")

//        request.predicate = NSPredicate(format: "username = %@", "ralphie")
//        request.predicate = NSPredicate(format: "age < %@", "10")
//
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)

            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        textField.alpha = 0
                        login.setTitle("Update username", for: [])
                        label.alpha = 1
                        label.text = "Hi there \(username) !"
                        logout.alpha = 1
                    }
                }
            }else{
                print("no results!")
            }

        } catch {
            print ("Can't fetch results")
        }

    }

}


//let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//newUser.setValue ("kirsten", forKey: "username")
//result.setValue("Dooley", forKey: "username")
//do {
//
//    try context.save()
//
//} catch {
//    print ("The process of renaming is failed")
//}

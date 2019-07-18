//
//  ViewController.swift
//  tic tac toe
//
//  Created by macbook on 6/25/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var activePlayer = 1
    var activeGame = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0-empty, 1-nought,2-cross
    
    @IBOutlet var label: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        
        activePlayer = 1
        activeGame = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        for i in 1..<10 {
            if let  button = view.viewWithTag(i) as?  UIButton {
                button.setImage(nil, for: .normal)
            }
            label.isHidden = true
            playAgainButton.isHidden = true
            label.center = CGPoint(x: label.center.x - 500, y: label.center.y )
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y:playAgainButton.center.y )
            
    
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let activePosition = sender.tag - 1
        let winningCombinations = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                                    [0, 3, 6], [1, 4, 7], [2, 5, 8],
                                    [0, 4, 8], [2, 4, 6]
                                  ]
        if gameState[activePosition] == 0  && activeGame{
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1{
                
                sender.setImage( UIImage(named: "nought"), for: .normal )
                activePlayer = 2
            } else {
                
                sender.setImage( UIImage(named: "cross"), for: .normal )
                activePlayer = 1
            }
            for combination in winningCombinations
             {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[2]] == gameState[combination[1]]
                {
                    // we have a winner!
                    
                    activeGame = false
                    label.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        label.text = "The noughts win!"
                    } else if  gameState[combination[0]] == 2 {
                        label.text = "The crosses win!"
                    }
                    UIView.animate(withDuration: 1, animations: {
                        self.label.center = CGPoint(x: self.label.center.x + 500, y: self.label.center.y )
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y )
                    })
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.isHidden = true
        playAgainButton.isHidden = true
        label.center = CGPoint(x: label.center.x - 500, y: label.center.y )
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y )
        
    }


}


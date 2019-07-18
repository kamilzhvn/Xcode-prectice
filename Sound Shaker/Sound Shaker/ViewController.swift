//
//  ViewController.swift
//  Sound Shaker
//
//  Created by macbook on 7/3/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype  == UIEvent.EventSubtype.motionShake {
            
            let soundArray = ["s1", "s2", "s3", "s4", "s5", "s6"]
            
            let randomNumber = arc4random_uniform(UInt32(soundArray.count))
          
            let fileLocation = Bundle.main.path(forResource:"\(soundArray[Int(randomNumber)])", ofType: "mp3")
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                player.play()
            } catch {

            }
        }
        }

}

/*
 
 var player = AVAudioPlayer()
 let audioPath = Bundle.main.path(forResource: "bach1", ofType: "mp3")
 var timer = Timer()
 
 @objc func updateScrubber (){
 scrubber.value = Float(player.currentTime)
 }
 
 @IBAction func play(_ sender: Any) {
 
 player.play()
 timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
 }
 @IBAction func pause(_ sender: Any) {
 
 player.pause()
 timer.invalidate()
 }
 @IBAction func stop(_ sender: Any) {
 
 scrubber.value = 0
 timer.invalidate()
 player.pause()
 
 
 @IBAction func volumeChanged(_ sender: Any) {
 
 player.volume = volume.value
 
 }
 @IBOutlet var volume: UISlider!
 @IBAction func scrubberChanged(_ sender: Any) {
 
 player.currentTime = TimeInterval(scrubber.value)
 
 }
 @IBOutlet var scrubber: UISlider!
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view.
 do {
 try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
 scrubber.maximumValue = Float(player.duration)
 } catch {
 
 }
 
 }
 
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view.
 
 let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture: )))
 swipeRight.direction = UISwipeGestureRecognizer.Direction.right
 self.view.addGestureRecognizer(swipeRight)
 
 let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture: )))
 swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
 self.view.addGestureRecognizer(swipeLeft)
 }
 
 }
 @objc func swiped (gesture: UIGestureRecognizer) {
 if let swipeGesture = gesture as? UISwipeGestureRecognizer{
 switch swipeGesture.direction{
 case UISwipeGestureRecognizer.Direction.right:
 print ("User swiped right")
 
 case UISwipeGestureRecognizer.Direction.left:
 print ("User swiped left")
 
 default:
 break
 }
 
 }
 }
 */

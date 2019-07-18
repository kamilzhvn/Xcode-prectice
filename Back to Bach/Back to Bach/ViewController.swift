//
//  ViewController.swift
//  Back to Bach
//
//  Created by macbook on 7/3/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
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
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            
        }
    }
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

}

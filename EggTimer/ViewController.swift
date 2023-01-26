//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //let softTime = 5
    //let mediumTime = 8
    //let hardTime = 12
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
    var totalTime = 0
    var secondsPassed = 0
    
    // create varible to track seconds
    //var secondsRemaining = 60
    
    // Get title text
    @IBOutlet weak var timerTitle: UILabel!
    
    // Get Progress bar
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardenessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        // store the title
        let hardeness = sender.currentTitle!
        
        // restart each time that I select the time egg on the screen
        self.secondsPassed = 0
        progressBar.progress = 0.0
        timerTitle.text = hardeness
        
        /*if(hardeness == "Soft") {
         print(eggTimes["Soft"]!)
         }
         if(hardeness == "Medium") {
         print(eggTimes["Medium"]!)
         }
         if(hardeness == "Hard") {
         print(eggTimes["Hardx"]!)
         }*/
        //print(eggTimes[hardeness]!)
        
        // transform minutes to second
        totalTime = eggTimes[hardeness]!
        
        func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        // create timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if self.secondsPassed < totalTime {
                self.secondsPassed += 1
                
                // Set porcentage
                let porcentageProgress = Float(secondsPassed) / Float(totalTime)
                
                // Set progressBar value
                progressBar.progress = porcentageProgress
                
            } else {
                // stop timer
                Timer.invalidate()
                // change value when time is done
                self.timerTitle.text = String("DONE!")
                // play sound
                playSound()
            }
        }
        
    }
    
    
}

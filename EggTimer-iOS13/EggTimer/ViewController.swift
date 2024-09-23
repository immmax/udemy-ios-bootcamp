//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var countdown = 0
    var timer = Timer()
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        if let hardness = sender.currentTitle {
            self.topLabel.text = "Wait!"
            countdown = eggTimes[hardness] ?? 0
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.countdown > 0 {
                    self.countdown -= 1
                } else {
                    timer.invalidate()
                    self.topLabel.text = "Done!"
                }
            }
        }
    }
}

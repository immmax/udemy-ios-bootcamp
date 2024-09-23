//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        secondsPassed = 0
        progressView.progress = 0
        
        if let hardness = sender.currentTitle {
            totalTime = eggTimes[hardness]!
            self.topLabel.text = hardness
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                if secondsPassed < totalTime {
                    secondsPassed += 1
                    self.progressView.progress = Float(secondsPassed) / Float(totalTime)
                } else {
                    timer.invalidate()
                    self.topLabel.text = "Done!"
                    playSound()
                }
            }
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            guard let player else { return }
            player.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}

//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound("C")
    }

    
    func playSound(_ note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
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


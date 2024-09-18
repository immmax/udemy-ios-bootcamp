//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
//        if hardness == "Soft" {
//            print("\(softTime) minutes")
//        } else if hardness == "Medium" {
//            print("\(mediumTime) minutes")
//        } else {
//            print("\(hardTime) minutes")
//        }
        
        switch hardness {
        case "Soft": print("\(softTime) minutes")
        case "Medium": print("\(mediumTime) minutes")
        default: print("\(hardTime) minutes")
        }
    }
    
}

//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!

    let dices = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix",]

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        diceImageViewOne.image = .init(named: dices.randomElement()!)
        diceImageViewTwo.image = .init(named: dices.randomElement()!)
    }
}


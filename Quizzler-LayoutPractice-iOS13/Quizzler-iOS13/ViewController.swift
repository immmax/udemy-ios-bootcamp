//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

struct Question {
    let id = UUID()
    let title: String
    let answer: String
    
    static let quiz = [
        Question(title: "Four + Two is equal to Six.", answer: "True"),
        Question(title: "Five - Three is greater than One.", answer: "True"),
        Question(title: "Three + Eight is less than Ten.", answer: "False")
    ]
}

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if userAnswer == Question.quiz[questionNumber].answer {
            print("✅ The answer is Right!")
        } else {
            print("❌ The answer is Wrong!")
        }
        
        if questionNumber < Question.quiz.count - 1 {
            questionNumber += 1
        } else {
            print("You have answered all questions!")
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = Question.quiz[questionNumber].title
    }
}


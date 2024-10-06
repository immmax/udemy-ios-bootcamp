//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 4)
        progressBar.layer.cornerRadius = 14
        progressBar.clipsToBounds = true
        progressBar.progress = 0.0
        updateUI()
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        disableButtons()
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = userGotItRight ? .green : .red
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.updateUI()
        }
    }
    
    func updateUI() {
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        enableButtons()
    }
    
    func disableButtons() {
        trueButton.isEnabled = false
        falseButton.isEnabled = false
    }
    
    func enableButtons() {
        trueButton.isEnabled = true
        falseButton.isEnabled = true
    }
}


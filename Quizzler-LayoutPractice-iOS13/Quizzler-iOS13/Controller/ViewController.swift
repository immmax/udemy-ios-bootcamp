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
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    
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
        scoreLabel.text = "Score: \(quizBrain.getScore()) / \(quizBrain.quiz.count)"
        
        questionLabel.text = quizBrain.getQuestionText()
        
        answer1Button.setTitle(quizBrain.getAnswer(number: 1), for: .normal)
        answer2Button.setTitle(quizBrain.getAnswer(number: 2), for: .normal)
        answer3Button.setTitle(quizBrain.getAnswer(number: 3), for: .normal)
        
        answer1Button.backgroundColor = .clear
        answer2Button.backgroundColor = .clear
        answer3Button.backgroundColor = .clear
        
        enableButtons()
    }
    
    func disableButtons() {
        answer1Button.isEnabled = false
        answer2Button.isEnabled = false
        answer3Button.isEnabled = false
    }
    
    func enableButtons() {
        answer1Button.isEnabled = true
        answer2Button.isEnabled = true
        answer3Button.isEnabled = true
    }
}


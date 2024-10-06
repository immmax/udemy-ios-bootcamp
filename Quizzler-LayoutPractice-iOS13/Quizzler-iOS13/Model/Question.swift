//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Maxim Datskiy on 9/25/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let id = UUID()
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}

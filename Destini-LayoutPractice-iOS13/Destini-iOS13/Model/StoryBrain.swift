//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let stories = [
        Story(title: "You see a fork in the road.", choice1: "Take a left", choice2: "Take a right"),
        Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
        Story(title: "You find a treasure chest.", choice1: "Open it.", choice2: "Check for traps.")
    ]
    
    var storyIndex = 0
    
    mutating func nextStory(userChoice: String) {
        if userChoice == stories[storyIndex].choice1 {
            storyIndex += 1
        } else {
            storyIndex += 2
        }
    }
}


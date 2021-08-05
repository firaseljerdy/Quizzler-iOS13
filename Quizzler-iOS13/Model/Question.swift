//
//  File.swift
//  Quizzler-iOS13
//
//  Created by Firas El Jerdy on 03/08/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correct: String) {
        text = q
        answers = a
        correctAnswer = correct
    }
    
}

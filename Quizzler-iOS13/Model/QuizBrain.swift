//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Firas El Jerdy on 05/08/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
private let quiz = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correct: "Skin"),
                    Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correct: "100"),
                    Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correct: "Greenwich Mean Time"),
                    Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correct: "Chapeau"),
                    Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correct: "Watch"),
                    Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correct: "Adiós"),
                    Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correct: "Orange"),
                    Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correct: "Rum"),
                    Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correct: "Gorilla"),
                    Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correct: "Australia")
]
    
    private var currentQuestion = 0
    private var userScore = 0
    
    private mutating func addUserScore() {
        userScore += 1
    }
    
    func getAnswers(question: Int) -> [String] {
        return quiz[question].answers
    }
    
    func getUserScore() -> Int {
        return userScore
    }
    
    mutating func resetUserScore() {
        userScore = 0
    }
    
    func getTotalQuestions() -> Int {
        return quiz.count - 1
    }
    
    mutating func nextQuestion() {
        currentQuestion += 1
    }
    
    mutating func firstQuestion() {
        currentQuestion = 0
    }
    
    func getQuestionText() -> String {
        return quiz[currentQuestion].text
    }
    
    func getCurrentQuestionCount() -> Int {
        return currentQuestion
    }
    
    func getRatioProgress() -> Float {
        return Float(currentQuestion) / Float(getTotalQuestions())
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[currentQuestion].correctAnswer {
            addUserScore()
            return true
        } else {
            return false
        }
    }
}

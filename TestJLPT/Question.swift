//
//  Question.swift
//  TestJLPT
//
//  Created by cmStudent on 15/12/2022.
//

import Foundation


class Question {
    //let questionImage: String
    let myanmarMean: String
    let question: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int
    
    init(questionText: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int,myanmarMean : String){
        //questionImage = image
        self.question = questionText
        self.optionA = choiceA
        self.optionB = choiceB
        self.optionC = choiceC
        self.optionD = choiceD
        self.correctAnswer = answer
        self.myanmarMean = myanmarMean
    }
}

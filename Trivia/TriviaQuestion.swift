//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Andrea Tinsley on 10/12/23.
//

import Foundation
import UIKit

struct APIResponse: Decodable {
    let responseCode: Int
    let Questions: [Question]
    
    private enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case Questions = "results"
    }
}

struct Question: Decodable {
    let category: String
    let type: QuestionType
    let difficulty: Difficulty
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    
    var shuffledOptions: [String] {
        var shuffledArray = incorrectAnswers + [correctAnswer].shuffled()
        return shuffledArray
    }
    
    enum QuestionType: String, Decodable {
        case multiple
        case boolean
        
    }
    
    enum Difficulty: String, Decodable {
        case easy
        case medium
        case hard
    }
    
    private enum CodingKeys: String, CodingKey {
        case category
        case type
        case difficulty
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}


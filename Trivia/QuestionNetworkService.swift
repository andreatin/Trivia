//
//  QuestionNetworkService.swift
//  Trivia
//
//  Created by Andrea Tinsley on 10/11/23.
//

import Foundation
import UIKit


class QuestionNetworkService {
    
    let urlString = "https://opentdb.com/api.php?amount=6"
    
    func fetchData(completion: (([Question]?) -> Void)? = nil) {
          let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                assertionFailure("Error: \(error!.localizedDescription)")
                completion?(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                assertionFailure("Invalid response")
                completion?(nil)
                return
            }
            
            guard let data = data, httpResponse.statusCode == 200 else {
                assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
                completion?(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let triviaResponse = try! decoder.decode(APIResponse.self, from: data)
                completion?(triviaResponse.Questions)
                
            } catch {
                assertionFailure("Decoding error: \(error)")
                completion?(nil)
                
            }
        }
            
          task.resume()
      }
    
    private static func parse(data: Data) -> [Question] {
        let jsonDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let resultsArray = jsonDictionary["results"] as! [[String: Any]]

        var questions: [Question] = []
        
        for result in resultsArray {
            let category = result["category"] as! String
            let type = result["type"] as! String
            let difficulty = result["difficulty"] as! String
            let question = result["question"] as! String
            let correctAnswer = result["correctAnswer"] as! String
            let incorrectAnswers = result["incorrectAnswers"] as! [String]
            
            let questionType = Question.QuestionType(rawValue: type) ?? .multiple// Default to `.multiple` if unknown
            let questionDifficulty = Question.Difficulty(rawValue: difficulty) ?? .medium // Default to `.medium` if unknown

            let triviaQuestion = Question(category: category,
                                                type: questionType,
                                                difficulty: questionDifficulty,
                                                question: question,
                                          correctAnswer: correctAnswer,
                                                incorrectAnswers: incorrectAnswers)
            questions.append(triviaQuestion)
        }
        
        return questions
    }

    
   
}





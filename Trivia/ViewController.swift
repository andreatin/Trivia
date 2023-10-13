//
//  ViewController.swift
//  Trivia
//
//  Created by Andrea Tinsley on 10/4/23.
//

import UIKit


class ViewController: UIViewController {
    
    private var questions = [Question]()
    private var questionNum = 0
    private var score = 0
    private var currentQuestionIndex = 0
    
    @IBOutlet weak var QuestionNumLabel: UILabel!
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var ButtonA: UIButton!
    @IBOutlet weak var ButtonB: UIButton!
    @IBOutlet weak var ButtonC: UIButton!
    @IBOutlet weak var ButtonD: UIButton!
    
    
    
    
    @IBAction func ButtonAPressed(_ sender: UIButton) {
        updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
        
    }
    
    @IBAction func ButtonBPressed(_ sender: UIButton) {
        updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
    }
    
    
    @IBAction func ButtonCPressed(_ sender: UIButton) {
        updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
        
    }
    
    
    @IBAction func ButtonDPressed(_ sender: UIButton) {
        updateToNextQuestion(answer: sender.titleLabel?.text ?? "")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion(withQuestionIndex: 0) // when the view loads, make sure the first location is shown
        updateQuestion(withQuestionIndex: 0)
        
        fetchQuestions()
    }
    
    private func fetchQuestions() {
        let networkService = QuestionNetworkService(  )
        networkService.fetchData { [weak self] (APIQuestions) in
            guard let strongSelf = self, let fetched = APIQuestions else { return }
            DispatchQueue.main.async {
                strongSelf.questions = fetched
                strongSelf.updateQuestion(withQuestionIndex: strongSelf.currentQuestionIndex)
            }
        }
    }
    
    private func updateQuestion(withQuestionIndex questionIndex: Int) {
        DispatchQueue.main.async {
            self.QuestionNumLabel.text = "Question: \(questionIndex + 1)/\(self.questions.count)"
            
            guard questionIndex < self.questions.count else { return }
            
            let question = self.questions[questionIndex]
            self.configure(with: question)
        }
    }
    
    private func updateToNextQuestion(answer: String) {
        let correct = checkCorrectAnswer(answer)
        if correct {
            score += 1
        }
        questionNum += 1
        
        if questionNum < questions.count {
            updateQuestion(withQuestionIndex: questionNum)
            ButtonC.isHidden = false
            ButtonD.isHidden = true
        }
        else
        {
            showScore()
        }
    }
    
    private func checkCorrectAnswer(_ answer: String) -> Bool {
        return answer == questions[questionNum].correctAnswer
    }
    
    private func resetGame() {
        questionNum = 0
        score = 0
        fetchQuestions()
    }
    
    
    private func configure(with question: Question) {
        
        QuestionLabel.text = question.question.decoded
        
        let answers: [String]
        if(question.type == .boolean) {
            answers = [question.correctAnswer, question.incorrectAnswers.first!].shuffled()
            ButtonC.isHidden = true
            ButtonD.isHidden = true
        } else {
            answers = ([question.correctAnswer] + question.incorrectAnswers).shuffled() // Properly concatenate arrays
            ButtonC.isHidden = false
            ButtonD.isHidden = false
        }
        
        ButtonA.setTitle(answers[0].decoded, for: .normal)
        ButtonB.setTitle(answers[1].decoded, for: .normal)
        
        if question.type != .boolean {
            ButtonC.setTitle(answers[2].decoded, for: .normal) // decode HTML entities
            ButtonD                                     .setTitle(answers[3].decoded, for: .normal) // decode HTML entities
            
        }
        
        
    }
    
    
    func showScore() {
        let alertController = UIAlertController(title: "Total Points", message: "You got \(score)/ \(questions.count) questions correct", preferredStyle: .alert)
        
        let playAgainAction = UIAlertAction(title: "Play Again", style: .default)
        alertController.addAction(playAgainAction)
        self.resetGame()
        present(alertController, animated: true, completion: nil)
    }
    
}
    extension String {
        var decoded: String {
            guard let data = data(using: .utf8) else {return self}
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
                return self
            }
            return attributedString.string
        }
        
    }
    


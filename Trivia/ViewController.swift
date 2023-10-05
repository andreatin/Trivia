//
//  ViewController.swift
//  Trivia
//
//  Created by Andrea Tinsley on 10/4/23.
//

import UIKit

var questionCount: Int = 1
var score: Int = 0

class ViewController: UIViewController {
    
    
    @IBOutlet weak var QuestionNumLabel: UILabel!
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var ButtonA: UIButton!
    @IBOutlet weak var ButtonB: UIButton!
    @IBOutlet weak var ButtonC: UIButton!
    @IBOutlet weak var ButtonD: UIButton!
    
    
    
    @IBAction func ButtonAPressed(_ sender: UIButton) {
        if(questionCount == 1)
        {
            if(ButtonA.titleLabel?.text == "Brazil")
            {
                score += 1
            }
            questionCount += 1;
            determineQuestion(parameter: questionCount)
            
        }
        else if (questionCount == 2)
        {
            if(ButtonA.titleLabel?.text == "Mickey Mouse")
            {
                score += 1
            }
            questionCount += 1;
            determineQuestion(parameter: questionCount)
            
        }
        else if(questionCount == 3)
        {
            if(ButtonA.titleLabel?.text == "Orlando")
            {
                score += 1
            }
            questionCount += 1
            determineQuestion(parameter: questionCount)
        }
        else
        {
            determineQuestion(parameter: questionCount)
        }
        
        
    }
    
    @IBAction func ButtonBPressed(_ sender: UIButton) {
        if(questionCount == 1)
        {
            if(ButtonB.titleLabel?.text == "Brazil")
            {
                score += 1
            }
            questionCount += 1;
            determineQuestion(parameter: questionCount)
        }
        else if (questionCount == 2)
        {
            if(ButtonB.titleLabel?.text == "Mickey Mouse")
            {
                score += 1
            }
            questionCount += 1;
            determineQuestion(parameter: questionCount)
        }
        else if(questionCount == 3)
        {
            if(ButtonB.titleLabel?.text == "Orlando")
            {
                score += 1
            }
            questionCount += 1
            determineQuestion(parameter: questionCount)
        }
        else
        {
            determineQuestion(parameter: questionCount)
        }
   
    }
    
    
    @IBAction func ButtonCPressed(_ sender: UIButton) {
        if(questionCount == 1)
        {
            if(ButtonC.titleLabel?.text == "Brazil")
            {
                score += 1
            }
            questionCount += 1;
            determineQuestion(parameter: questionCount)
        }
        else if (questionCount == 2)
        {
            if(ButtonC.titleLabel?.text == "Mickey Mouse")
            {
                score += 1
            }
            questionCount += 1;
            determineQuestion(parameter: questionCount)
        }
        else if(questionCount == 3)
        {
            if(ButtonC.titleLabel?.text == "Orlando")
            {
                score += 1
            }
            questionCount += 1
            determineQuestion(parameter: questionCount)
        }
        else
        {
            determineQuestion(parameter: questionCount)
        }
      
    }
    
    
    @IBAction func ButtonDPressed(_ sender: UIButton) {
        if(questionCount == 1)
        {
            if(ButtonD.titleLabel?.text == "Brazil")
            {
                score += 1
            }
            questionCount += 1;
            determineQuestion(parameter: questionCount)
        }
        else if (questionCount == 2)
        {
            if(ButtonD.titleLabel?.text == "Mickey Mouse")
            {
                score += 1
            }
            questionCount += 1;
            determineQuestion(parameter: questionCount)
        }
        else if(questionCount == 3)
        {
            if(ButtonD.titleLabel?.text == "Orlando")
            {
                score += 1
            }
            questionCount += 1
            determineQuestion(parameter: questionCount)
        }
        else
        {
            determineQuestion(parameter: questionCount)
        }
        
    }
    
    
    func determineQuestion(parameter: Int){
        
        let Question1: String = "What is the largest country in South America?"
        let Question2: String = "What is the name of the disney character who has a clubhouse?"
        let Question3: String = "Where is Disney World located?"
        
        if(questionCount == 1)
        {
            QuestionNumLabel.text = "Question 1/3"
            QuestionLabel.text = Question1
            ButtonA.setTitle("Brazil", for: .normal)
            ButtonB.setTitle("Ecuador", for: .normal)
            ButtonC.setTitle("Argentina", for: .normal)
            ButtonD.setTitle("Colombia", for: .normal)
           
        }
        else if(questionCount == 2)
        {
            QuestionNumLabel.text = "Question 2/3"
            QuestionLabel.text = Question2
            
            ButtonA.setTitle("Donald Duck", for: .normal)
            ButtonB.setTitle("Mickey Mouse", for: .normal)
            ButtonC.setTitle("Goofy", for: .normal)
            ButtonD.setTitle("Daisy", for: .normal)
            
        }
        else if(questionCount == 3)
        {
            QuestionNumLabel.text = "Question 3/3"
            QuestionLabel.text = Question3
            
            ButtonA.setTitle("Atlanta", for: .normal)
            ButtonB.setTitle("Miami", for: .normal)
            ButtonC.setTitle("Orlando", for: .normal)
            ButtonD.setTitle("New York", for: .normal)
              
        }
        else
        {
            showScore()
        }
        
    }
    
    func showScore() {
        let alertController = UIAlertController(title: "Total Points", message: "You got \(score)/3 questions correct", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

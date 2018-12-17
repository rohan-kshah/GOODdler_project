//
//  ComprehensionOneViewController.swift
//  game-project
//
//  Created by Rohan Shah on 6/19/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//
// this the first game page of the comprehension section

import UIKit

class ComprehensionOneViewController: UIViewController {
    let intIndex = 1
   
    @IBAction func correctAnswerButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Right Answer!", message: "Click to view next question", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
           return
    }
        alert.addAction(action)
        self.present(alert, animated: false)
    }
    @IBOutlet weak var correctAnswerButtonOutlet: UIButton!
    
    @IBOutlet weak var wrongAnswerTwoButtonOutlet: UIButton!
    @IBAction func wrongAnswerOneButton(_ sender: Any) {
            let alert = UIAlertController(title: "Wrong Answer!", message:s "Click to try again", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                return
        }
            alert.addAction(action)
            self.present(alert, animated: false)
    }
    
    func changeQuestion() {
        // update the question label to be the next thing in the array of questions (or a random one)
        
        
    }
    
    @IBAction func wrongAnswerTwoButton(_ sender: Any) {
        let alert = UIAlertController(title: "Wrong Answer!", message: "Click to try again", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            return
        }
        alert.addAction(action)
        self.present(alert, animated: false)
    }
    @IBOutlet weak var wrongAnswerOneButtonOutlet: UIButton!
    
    
    @IBAction func wrongAnswerThreeButton(_ sender: Any) {
        let alert = UIAlertController(title: "Wrong Answer!", message: "Click to try again", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            return
        }
        alert.addAction(action)
        self.present(alert, animated: false)
    }
    @IBOutlet weak var wrongAnswerThreeButtonOutlet: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var passageLabel: UILabel!
   
    var correctAnswer: String!
    var passages = ["P1", "P2"]
    var passagesToQuestions = ["P1": ["P1 Q1", "P1 Q2", "P1 Q3"], "P2": ["P2 Q1", "P2 Q2", "P2 Q3"]]
    var questionsToAnswers = ["P1 Q1": ["P1 Q1 A1", "P1 Q1 A2", "P1 Q1 A3", "P1 Q1 A4"], "P1 Q2": ["P1 Q2 A1", "P1 Q2 A2", "P1 Q2 A3", "P1 Q2 A4"]]
    // if answer is in question1ADecoys, then the user answer is incorrect
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionIndex = 0
        let passage = passages[0]
        passageLabel.text = passage
        questionLabel.text = passagesToQuestions[passage]?[questionIndex]
        let question = passagesToQuestions[passage]?[questionIndex]

        var answerArray = questionsToAnswers[question!]
        correctAnswer = questionsToAnswers[question!]?[0]
        answerArray?.remove(at: 0)
        wrongAnswerOneButtonOutlet.setTitle(answerArray?[0], for: .normal)
        wrongAnswerTwoButtonOutlet.setTitle(answerArray?[1], for: .normal)
        wrongAnswerThreeButtonOutlet.setTitle(answerArray?[2], for: .normal)
        correctAnswerButtonOutlet.setTitle(correctAnswer, for: .normal)


        
        
   
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

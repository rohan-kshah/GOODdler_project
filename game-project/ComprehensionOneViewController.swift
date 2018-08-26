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

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var passageLabel: UILabel!
    var questionMapDic = ["PassageA": ["Question1A": "A1A", "Question2A": "A2A", "Question3A": "A3A", "Question4A": "A4A"], "PassageB": ["Question1B": "A1B", "Question2B": "A2B", "Question3B": "A3B", "Question4B": "A4B"]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passageLabel.text = questionMapDic.keys.first
        questionLabel.text = questionMapDic["PassageA"]?.keys.first
        answerLabel.text = questionMapDic["PassageA"]![questionLabel.text!]

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

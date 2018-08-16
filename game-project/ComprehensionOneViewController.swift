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
    @IBOutlet weak var comprehensionScore: UITextField!
    
    @IBOutlet weak var comprehensionScoreLabel: UILabel!
    @IBAction func comprehensionOneButton(_ sender: UIButton) {
        comprehensionScoreLabel.text = comprehensionScore.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

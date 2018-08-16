//
//  GrammarOneSViewController.swift
//  game-project
//
//  Created by Rohan Shah on 6/20/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//
// this is the first score page of the grammar section

import UIKit

class GrammarOneSViewController: UIViewController {

    @IBOutlet weak var scoreOneLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let score = UserDefaults.standard.string(forKey: "grammarScore")
        scoreOneLabel.text = score

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

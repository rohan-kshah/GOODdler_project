//
//  NounLessonViewController.swift
//  game-project
//
//  Created by Rohan Shah on 11/3/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//

import UIKit

class NounLessonViewController: UIViewController {
    var count = 0
    @IBOutlet weak var goToGameButtonOutlet: UIButton!
    @IBAction func goToGameButton(_ sender: UIButton) {
    }
    @IBOutlet weak var nextPageButtonOutlet: UIButton!
    @IBAction func nextPageButton(_ sender: UIButton) {
        if (count < instructionArray.count)
        {
            
            if (count == 0)
            {
                count += 1
            }
            instructionLabel.text = instructionArray[count]
            count += 1
            if (count == 6)
            {
                nextPageButtonOutlet.isHidden = true
                goToGameButtonOutlet.isHidden = false
            }
        }
    }
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    var instructionArray = ["Let's learn about nouns.", "Think about a noun in four different ways", "First, a noun can be a place. Example: My dog ran to the park. Park is a place, so it is a noun.", "Second, a noun can be a person. Example: Our teacher read from the book. A teacher is a kind of person, so it is a noun.", "Third, a noun can be a thing. Example: I read the book. The book is a thing, so it is a noun.", "Last, a noun can be an idea. Example: The teacher had great trust in her students. Trust is an idea, so it is a noun."]

    override func viewDidLoad() {
        super.viewDidLoad()
        instructionLabel.numberOfLines = 0
        goToGameButtonOutlet.isHidden = true
        

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

//
//  ViewController.swift
//  game-project
//
//  Created by Rohan Shah on 6/17/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//
import Firebase
import FirebaseDatabase

import UIKit

class ViewController: UIViewController {
    var ref: DatabaseReference!
    let dummyFrame = CGRect(x: 0, y:0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Skilledreaders")
        self.view.insertSubview(backgroundImage, at: 0)

        let animation = AnimationView(frame: dummyFrame, messageString: "Welcome!")
        view.addSubview(animation)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


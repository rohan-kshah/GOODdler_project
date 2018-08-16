//
//  LeaderboardView.swift
//  game-project
//
//  Created by Rohan Shah on 7/12/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//

import UIKit
import Firebase

class LeaderboardView: UIView {
    
    init(frame: CGRect, highScores: Array<String>){
        super.init(frame: frame)
        var scores = ""
        var label = UILabel()
        for highscore in highScores {
            scores += highscore
        }
        label.text = scores
        label.frame = frame
        label.numberOfLines = 0
        self.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

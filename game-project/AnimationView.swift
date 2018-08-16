//
//  AnimationView.swift
//  game-project
//
//  Created by Rohan Shah on 6/29/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class AnimationView: UIView {
    init(frame: CGRect, messageString:String){
        super.init(frame: frame)
        let messageLabel = UILabel()
        messageLabel.text = messageString
        messageLabel.frame = CGRect(x: 755.0, y: 430, width: 150.0, height: 150.0)
        let gif = UIImage.gif(name: "ThumbsUp")
        let gifView = UIImageView(image: gif)
        gifView.frame = CGRect(x: 650.0, y: 550.0, width: 215.0, height: 215.0)
        let speechBubble = UIImage(named: "speechBubble.png")
        let image = UIImage(named: "speechBubble.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 730.0, y: 450.0, width: 150.0, height: 150.0)
        
        self.addSubview(messageLabel)
        self.addSubview(gifView)
        self.addSubview(imageView)
        
        //I know I need to now place the gif on the screen, but i cannot find the syntax right now on google
        // I think my errors are because I didn't do something right on the gif and speechBubble adding thing. I'm super confused.
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */



//
//  GrammarOneViewController.swift
//  game-project
//
//  Created by Rohan Shah on 6/19/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//
// this is the first page of the grammar section where the first game will be

import UIKit
import Firebase

class GrammarOneViewController: UIViewController {
    var ref: DatabaseReference!
    var timerTest : Timer?
    var numSeconds = 25.0
    var matchesArray = Array<Bool>()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var isTaken = [false, false, false, false, false, false]
        let nounCat = UIButton(type: UIButtonType.system)
        let adjCat = UIButton(type: UIButtonType.system)
        let verbCat = UIButton(type: UIButtonType.system)
    
    private lazy var verbOne: UIButton = {
        let minimumTappableHeight: CGFloat = 120
        let verbOne = UIButton(frame: CGRect(x: 100, y: 200,
                                            width: minimumTappableHeight,
                                            height: minimumTappableHeight))
        verbOne.layer.cornerRadius = minimumTappableHeight / 2
        verbOne.layer.masksToBounds = true
        verbOne.backgroundColor = UIColor.blue
        verbOne.setTitle("run", for: .normal)
        verbOne.setTitle("run", for: .highlighted)

        
        return verbOne
    }()
    
    
    private lazy var verbTwo: UIButton = {
        let minimumTappableHeight: CGFloat = 120
        let verbTwo = UIButton(frame: CGRect(x: 600, y: 200,
                                             width: minimumTappableHeight,
                                             height: minimumTappableHeight))
        verbTwo.layer.cornerRadius = minimumTappableHeight / 2
        verbTwo.layer.masksToBounds = true
        verbTwo.backgroundColor = UIColor.blue
        verbTwo.setTitle("received", for: .normal)
        verbTwo.setTitle("received", for: .highlighted)
        
        
        return verbTwo
    }()
    
    private lazy var adjOne: UIButton = {
        let minimumTappableHeight: CGFloat = 120
        let adjOne = UIButton(frame: CGRect(x: 300, y: 200,
                                             width: minimumTappableHeight,
                                             height: minimumTappableHeight))
        adjOne.layer.cornerRadius = minimumTappableHeight / 2
        adjOne.layer.masksToBounds = true
        adjOne.backgroundColor = UIColor.blue
        adjOne.setTitle("tall", for: .normal)
        adjOne.setTitle("tall", for: .highlighted)
        
        return adjOne
    }()
    
    private lazy var adjTwo: UIButton = {
        let minimumTappableHeight: CGFloat = 120
        let adjTwo = UIButton(frame: CGRect(x: 800, y: 200,
                                            width: minimumTappableHeight,
                                            height: minimumTappableHeight))
        adjTwo.layer.cornerRadius = minimumTappableHeight / 2
        adjTwo.layer.masksToBounds = true
        adjTwo.backgroundColor = UIColor.blue
        adjTwo.setTitle("happy", for: .normal)
        adjTwo.setTitle("happy", for: .highlighted)
        
        return adjTwo
    }()
    
    private lazy var nounOne: UIButton = {
        let minimumTappableHeight: CGFloat = 120
        let nounOne = UIButton(frame: CGRect(x: 500, y: 300,
                                             width: minimumTappableHeight,
                                             height: minimumTappableHeight))
        nounOne.layer.cornerRadius = minimumTappableHeight / 2
        nounOne.layer.masksToBounds = true
        nounOne.backgroundColor = UIColor.blue
        nounOne.setTitle("cat", for: .normal)
        nounOne.setTitle("cat", for: .highlighted)
        
        
        return nounOne
    }()
    
    
    private lazy var nounTwo: UIButton = {
        let minimumTappableHeight: CGFloat = 120
        let nounTwo = UIButton(frame: CGRect(x: 500, y: 200,
                                             width: minimumTappableHeight,
                                             height: minimumTappableHeight))
        nounTwo.layer.cornerRadius = minimumTappableHeight / 2
        nounTwo.layer.masksToBounds = true
        nounTwo.backgroundColor = UIColor.blue
        nounTwo.setTitle("food", for: .normal)
        nounTwo.setTitle("food", for: .highlighted)
        
        
        return nounTwo
    }()
    
    
    
    func placeTile(tile: UIButton) {
        let locationArray = [CGRect(x: 300, y: 550, width: 150.0, height: 150.0), CGRect(x: 500, y: 550
            , width: 150.0, height: 150.0), CGRect(x: 700, y: 550, width: 150.0, height: 150.0)]
        tile.backgroundColor = UIColor.red
        var randomIndex = Int(arc4random_uniform(3))
        
        
        while (true){
            if (isTaken[randomIndex] == true){
                randomIndex = Int(arc4random_uniform(3))
            } else {
                tile.frame = locationArray[randomIndex]
                view.addSubview(tile)
                isTaken[randomIndex] = true
                break
            }
        }
    }
    
    
    @objc func drag(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        matchesArray = [false, false, false, false, false, false]
        scheduledTimerWithTimeInterval()

        nounCat.setTitle("noun", for: .normal)
        adjCat.setTitle("adjective", for: .normal)
        verbCat.setTitle("verb", for: .normal)

        self.placeTile(tile: self.nounCat)
        self.placeTile(tile: self.adjCat)
        self.placeTile(tile: self.verbCat)
        view.addSubview(verbOne)
        verbOne.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: UIControlEvents.touchDragInside)
        
        verbOne.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: [UIControlEvents.touchDragExit,
                               UIControlEvents.touchDragOutside])
        view.addSubview(adjOne)
        adjOne.addTarget(self,
                          action: #selector(drag(control:event:)),
                          for: UIControlEvents.touchDragInside)
        adjOne.addTarget(self,
                          action: #selector(drag(control:event:)),
                          for: [UIControlEvents.touchDragExit,
                                UIControlEvents.touchDragOutside])
        view.addSubview(nounOne)
        nounOne.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: UIControlEvents.touchDragInside)
        nounOne.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: [UIControlEvents.touchDragExit,
                               UIControlEvents.touchDragOutside])
        view.addSubview(verbTwo)
        verbTwo.addTarget(self,
                          action: #selector(drag(control:event:)),
                          for: UIControlEvents.touchDragInside)
        
        verbTwo.addTarget(self,
                          action: #selector(drag(control:event:)),
                          for: [UIControlEvents.touchDragExit,
                                UIControlEvents.touchDragOutside])
        view.addSubview(adjTwo)
        adjTwo.addTarget(self,
                          action: #selector(drag(control:event:)),
                          for: UIControlEvents.touchDragInside)
        
        adjTwo.addTarget(self,
                          action: #selector(drag(control:event:)),
                          for: [UIControlEvents.touchDragExit,
                                UIControlEvents.touchDragOutside])
        view.addSubview(nounTwo)
        nounTwo.addTarget(self,
                          action: #selector(drag(control:event:)),
                          for: UIControlEvents.touchDragInside)
        
        nounTwo.addTarget(self,
                          action: #selector(drag(control:event:)),
                          for: [UIControlEvents.touchDragExit,
                                UIControlEvents.touchDragOutside])




        // Do any additional setup after loading the view.
    }
    
    func goToPrevPage(){
        let leaderboardPage = self.storyboard?.instantiateViewController(withIdentifier: "leaderboardPage") as! LeaderboardViewController
        self.present(leaderboardPage, animated: false)
        
    }
    
    func stopTimerTest() {
        if timerTest != nil {
            timerTest?.invalidate()
            timerTest = nil
        }
    }
    
    @objc func updateCounting(){
        if numSeconds.rounded() == 0.0 {
            let alert = UIAlertController(title: "You Lose", message: "Click to go back", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                self.goToPrevPage()
            }
            alert.addAction(action)
            self.present(alert, animated: false
            )
            stopTimerTest()
            

        }
        
        if matchesArray == [true, true, true, true, true, true] { // when you win
            stopTimerTest()
            let alert = UIAlertController(title: "You Win", message: "Click to go forward", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                self.goToPrevPage()
            }
            alert.addAction(action)
            self.present(alert, animated: false)
            let username = UserDefaults.standard.string(forKey: "username")!
            ref = Database.database().reference().child("leaderboard").child(username)
            ref.observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value
              
                print("---------")
                print(value!)
                self.ref.setValue(NSNumber(value: Int(self.numSeconds + Double(value as! Int))))

            })
            //let currScore = ref.value(forKey: username) as! NSNumber
           // print(currScore)

          //  ref.setValue(NSNumber(value: Int(numSeconds)))
            
        }
        
      
        if numSeconds >= 0.1  {
            numSeconds = numSeconds - 0.1
            timerLabel.text = String(numSeconds.rounded())
            
        }
        
        
        
        if (abs(nounOne.frame.origin.x - nounCat.frame.origin.x) <= 20 && abs(nounOne.frame.origin.y - nounCat.frame.origin.y) <= 20){
            nounOne.removeFromSuperview()
            matchesArray[0] = true
        }
        if (abs(verbOne.frame.origin.x - verbCat.frame.origin.x) <= 20 && abs(verbOne.frame.origin.y - verbCat.frame.origin.y) <= 20){
            verbOne.removeFromSuperview()
            matchesArray[1] = true
        }
        if (abs(verbTwo.frame.origin.x - verbCat.frame.origin.x) <= 20 && abs(verbTwo.frame.origin.y - verbCat.frame.origin.y) <= 20){
            verbTwo.removeFromSuperview()
            matchesArray[2] = true

        }
        if (abs(adjOne.frame.origin.x - adjCat.frame.origin.x) <= 20 && abs(adjOne.frame.origin.y - adjCat.frame.origin.y) <= 20){
            adjOne.removeFromSuperview()
            matchesArray[3] = true

        }
        if (abs(adjTwo.frame.origin.x - adjCat.frame.origin.x) <= 20 && abs(adjTwo.frame.origin.y - adjCat.frame.origin.y) <= 20){
            adjTwo.removeFromSuperview()
            matchesArray[4] = true


        }
        if (abs(nounTwo.frame.origin.x - nounCat.frame.origin.x) <= 20 && abs(nounTwo.frame.origin.y - nounCat.frame.origin.y) <= 20){
            nounTwo.removeFromSuperview()
            matchesArray[5] = true

        }
        
        //check if noun one is not in the right spot
        if ((abs(nounOne.frame.origin.x - verbCat.frame.origin.x) <= 20 && abs(nounOne.frame.origin.y - verbCat.frame.origin.y) <= 20)) || ((abs(nounOne.frame.origin.x - adjCat.frame.origin.x) <= 20 && abs(nounOne.frame.origin.y - adjCat.frame.origin.y) <= 20)){
            nounOne.removeFromSuperview()
            nounOne.frame = CGRect(x: 300, y: 200, width: 120, height: 120)
            view.addSubview(nounOne)
            numSeconds -= 5
            
        }
        //nountwo send back if put in wrong cateogory
        if ((abs(nounTwo.frame.origin.x - verbCat.frame.origin.x) <= 20 && abs(nounTwo.frame.origin.y - verbCat.frame.origin.y) <= 20)) || ((abs(nounTwo.frame.origin.x - adjCat.frame.origin.x) <= 20 && abs(nounTwo.frame.origin.y - adjCat.frame.origin.y) <= 20)){
            nounTwo.removeFromSuperview()
            nounTwo.frame = CGRect(x: 300, y: 200, width: 120, height: 120)
            view.addSubview(nounTwo)
            numSeconds -= 5

        }
       //adj two send bcka if put in wrong category
        if ((abs(adjTwo.frame.origin.x - verbCat.frame.origin.x) <= 20 && abs(adjTwo.frame.origin.y - verbCat.frame.origin.y) <= 20)) || ((abs(adjTwo.frame.origin.x - nounCat.frame.origin.x) <= 20 && abs(adjTwo.frame.origin.y - nounCat.frame.origin.y) <= 20)){
            adjTwo.removeFromSuperview()
            adjTwo.frame = CGRect(x: 300, y: 200, width: 120, height: 120)
            view.addSubview(adjTwo)
            numSeconds -= 5

        }
        //adjOne send back if put in wrong category
        if ((abs(adjOne.frame.origin.x - verbCat.frame.origin.x) <= 20 && abs(adjOne.frame.origin.y - verbCat.frame.origin.y) <= 20)) || ((abs(adjOne.frame.origin.x - nounCat.frame.origin.x) <= 20 && abs(adjOne.frame.origin.y - nounCat.frame.origin.y) <= 20)){
            adjOne.removeFromSuperview()
            adjOne.frame = CGRect(x: 300, y: 200, width: 120, height: 120)
            view.addSubview(adjOne)
            numSeconds -= 5

        }
        //verb one send back if put in wrong category
        if ((abs(verbOne.frame.origin.x - adjCat.frame.origin.x) <= 20 && abs(verbOne.frame.origin.y - adjCat.frame.origin.y) <= 20)) || ((abs(verbOne.frame.origin.x - nounCat.frame.origin.x) <= 20 && abs(verbOne.frame.origin.y - nounCat.frame.origin.y) <= 20)){
            verbOne.removeFromSuperview()
            verbOne.frame = CGRect(x: 300, y: 200, width: 120, height: 120)
            view.addSubview(verbOne)
            numSeconds -= 5

        }
        if ((abs(verbTwo.frame.origin.x - adjCat.frame.origin.x) <= 20 && abs(verbTwo.frame.origin.y - adjCat.frame.origin.y) <= 20)) || ((abs(verbTwo.frame.origin.x - nounCat.frame.origin.x) <= 20 && abs(verbTwo.frame.origin.y - nounCat.frame.origin.y) <= 20)){
            verbTwo.removeFromSuperview()
            verbTwo.frame = CGRect(x: 300, y: 200, width: 120, height: 120)
            view.addSubview(verbTwo)
            numSeconds -= 5

        }
        
    }

    func scheduledTimerWithTimeInterval(){
      
        
            if timerTest == nil {
                timerTest =  Timer.scheduledTimer(
                    timeInterval: TimeInterval(0.1),
                    target      : self,
                    selector    : #selector(updateCounting),
                    userInfo    : nil,
                    repeats     : true)
            }
        }
       
    

}

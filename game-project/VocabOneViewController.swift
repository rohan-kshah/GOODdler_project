//
//  VocabOneViewController.swift
//  game-project
//
//  Created by Rohan Shah on 6/19/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//
// this is the first vocab page of the vocab section

import UIKit
import Firebase

class VocabOneViewController: UIViewController {
    var count = 0
    var matchesCount = 0
    var ref: DatabaseReference!
    var timerTest : Timer?
    var numSeconds = 25.0
    @IBOutlet weak var timerLabel: UILabel!
    


    
    var dictionaryWords = ["appear": "to come into view", "appetite": "wanting food", "argued": "if you argue with someone, you don't agree", "beacon": "a light that warns people of danger", "built": "to make something", "birthday": "the day you were born", "bigger": "means larger", "canoe": "a long, thin boat", "card": "a small piece of thick paper", "beautiful": "very nice to look at", "city": "a place where many people live and work"]
    
    var keyWords = ["appear", "appetite", "argued", "beacon", "built", "birthday", "bigger", "card", "canoe", "beautiful", "city"]
    
    
    var isTaken = [false, false, false, false, false, false]
    let tileOne = UIButton(type: UIButtonType.system)
    let tileOneDef = UIButton(type: UIButtonType.system)
    let tileTwo = UIButton(type: UIButtonType.system)
    let tileTwoDef = UIButton(type: UIButtonType.system)
    let tileThree = UIButton(type: UIButtonType.system)
    let tileThreeDef = UIButton(type: UIButtonType.system)
    
    
    func matchingCards(){
        if tileOne.isSelected == true && tileOneDef.isSelected == true {
            tileOne.removeFromSuperview()
            tileOneDef.removeFromSuperview()
            count = 0
            tileOne.isSelected = false
            tileOneDef.isSelected = false
            matchesCount += 1

        } else if tileTwo.isSelected == true && tileTwoDef.isSelected == true {
            tileTwo.removeFromSuperview()
            tileTwoDef.removeFromSuperview()
            count = 0
            tileTwo.isSelected = false
            tileTwoDef.isSelected = false
            matchesCount += 1

        } else if tileThree.isSelected == true && tileThreeDef.isSelected == true {
            tileThree.removeFromSuperview()
            tileThreeDef.removeFromSuperview()
            count = 0
            tileThree.isSelected = false
            tileThreeDef.isSelected = false
            matchesCount += 1

            }
    }
    
    func selectCard(tile: UIButton){
    
      
       
        if count == 2 && tile.isSelected == true {
            
            count = count - 1
            tile.backgroundColor = UIColor.red
            tile.isSelected = false
            return
            
        }
        
        if count == 2 && tile.isSelected == false {
            return
        }
        
     
        
        if tile.isSelected {
                count = count - 1
                tile.backgroundColor = UIColor.red
                tile.isSelected = false
        } else {
                count = count + 1
                tile.backgroundColor = UIColor.green
                tile.isSelected = true
        }
        
        print(count)

        
        if count == 2 {
            matchingCards()
            
        }
        
        

      

    }
   
    @IBAction func tileOnePressed(button: UIButton) {
        self.selectCard(tile: self.tileOne)
    }
    @IBAction func tileTwoPressed(button: UIButton) {
        self.selectCard(tile: self.tileTwo)
    }
    @IBAction func tileOneDefPressed(button: UIButton) {
        self.selectCard(tile: self.tileOneDef)
    }
    @IBAction func tileTwoDefPressed(button: UIButton) {
        self.selectCard(tile: self.tileTwoDef)
    }
    @IBAction func tileThreePressed(button: UIButton) {
        self.selectCard(tile: self.tileThree)
    }
    @IBAction func tileThreeDefPressed(button: UIButton) {
        self.selectCard(tile: self.tileThreeDef)
    }
    
    
    
    
    
    
    func placeTile(tile: UIButton) {
        let locationArray = [CGRect(x: 300, y: 300, width: 150.0, height: 150.0), CGRect(x: 500, y: 300, width: 150.0, height: 150.0), CGRect(x: 300, y: 500, width: 150.0, height: 150.0), CGRect(x: 500, y: 500, width: 150.0, height: 150.0), CGRect(x: 700, y: 500, width: 150.0, height: 150.0), CGRect(x: 700, y: 300, width: 150.0, height: 150.0)]
        tile.backgroundColor = UIColor.red
        var randomIndex = Int(arc4random_uniform(6))
        

        while (true){
            if (isTaken[randomIndex] == true){
                randomIndex = Int(arc4random_uniform(6))
            } else {
                tile.frame = locationArray[randomIndex]
                view.addSubview(tile)
                isTaken[randomIndex] = true
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scheduledTimerWithTimeInterval()
        self.placeTile(tile: self.tileOne)
        self.placeTile(tile: self.tileTwo)
        self.placeTile(tile: self.tileThree)
        self.placeTile(tile: self.tileOneDef)
        self.placeTile(tile: self.tileTwoDef)
        self.placeTile(tile: self.tileThreeDef)
        
        tileOne.addTarget(self, action: #selector(tileOnePressed), for: .touchUpInside)
        tileOneDef.addTarget(self, action: #selector(tileOneDefPressed), for: .touchUpInside)
        tileTwo.addTarget(self, action: #selector(tileTwoPressed), for: .touchUpInside)
        tileTwoDef.addTarget(self, action: #selector(tileTwoDefPressed), for: .touchUpInside)
        tileThree.addTarget(self, action: #selector(tileThreePressed), for: .touchUpInside)
        tileThreeDef.addTarget(self, action: #selector(tileThreeDefPressed), for: .touchUpInside)

        
        var numsUsed = Set<Int>()
        
        for i in 0...2{
            
            var index = Int(arc4random_uniform(10))
            
            while numsUsed.contains(index){
                index = Int(arc4random_uniform(10))
            }
            
            if !numsUsed.contains(index){
                numsUsed.insert(index)
                let keyWord = keyWords[index]
                
                if i == 0 {
                    tileOne.setTitle(keyWord, for: .normal)
                    tileOneDef.setTitle(dictionaryWords[keyWord], for: .normal)
                    tileOneDef.titleLabel?.numberOfLines = 0
                } else if i == 1 {
                    tileTwo.setTitle(keyWord, for: .normal)
                    tileTwoDef.setTitle(dictionaryWords[keyWord], for: .normal)
                    tileTwoDef.titleLabel?.numberOfLines = 0
                } else if i == 2 {
                    tileThree.setTitle(keyWord, for: .normal)
                    tileThreeDef.setTitle(dictionaryWords[keyWord], for: .normal)
                    tileThreeDef.titleLabel?.numberOfLines = 0
                }
                
            
            }
        
        
        // Do any additional setup after loading the view.
        }
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
    @objc func updateCounting(){
        numSeconds = numSeconds - 0.1
        timerLabel.text = String(numSeconds.rounded())

        if numSeconds.rounded() == 0.0 {
            let alert = UIAlertController(title: "You Lose", message: "Click to go back", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            }
            alert.addAction(action)
            self.present(alert, animated: false
            )
            stopTimerTest()
            
            
        }
        if  matchesCount == 3 {
            
            // when you win
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
        
        
        
    }
        
        func stopTimerTest() {
            if timerTest != nil {
                timerTest?.invalidate()
                timerTest = nil
            }
        }
    func goToPrevPage(){
        let leaderboardPage = self.storyboard?.instantiateViewController(withIdentifier: "leaderboardPage") as! LeaderboardViewController
        self.present(leaderboardPage, animated: false)
        
    }
    
   

}

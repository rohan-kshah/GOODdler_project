//
//  LeaderboardViewController.swift
//  game-project
//
//  Created by Rohan Shah on 7/12/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

var scores = ["8, 3, 2, 4, 9, 12"]
class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        cell.textLabel?.text = highScores[indexPath.item]
        return cell
    }
    
    let dummyFrame = CGRect(x: 0, y:0, width: 0, height: 0)
    var ref: DatabaseReference!
    var highScores = Array<String>()
    var sortableArray = Array<[String:Int]>()

    func sortLeaderboard() {
        scores.sort()
        print(scores)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewObject.reloadData()

        ref = Database.database().reference()
        
        let animation = AnimationView(frame: dummyFrame, messageString: "Time do get more points. Click the button to earn points. ")
        view.addSubview(animation)
        
        //allows accesss to variable from other class
        var username = UserDefaults.standard.string(forKey: "username")
        print(username!)
        
        
        
        
        self.ref.child("leaderboard").observe(DataEventType.value) { (snapshot) in
            let users = snapshot.children.allObjects as! [DataSnapshot]
            for userObject in users {
                
                self.sortableArray.append([userObject.key: userObject.value as! Int])
                
                print(self.sortableArray)
                
                    
                    
                self.highScores.append(userObject.key + " : " + String(userObject.value as! Int))
                
            }
            
            
            self.tableViewObject.reloadData()
            
            print(self.highScores)
            
            
            
        }
       

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var tableViewObject: UITableView!
    
    
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

//
//  LoginViewController.swift
//  game-project
//
//  Created by Rohan Shah on 6/19/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//
// this is the page where you login to an existing username in firebase

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    let dummyFrame = CGRect(x: 0, y:0, width: 0, height: 0)
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    func goToNextPage(){
        let leaderboardPage = self.storyboard?.instantiateViewController(withIdentifier: "leaderboardPage") as! LeaderboardViewController
        self.present(leaderboardPage, animated: false)
    }
    
    @IBAction func tryToLogin(_ sender: UIButton) {
        let password = passwordTextField.text!
        let email = emailTextField.text!
        let username = usernameTextField.text!
        Auth.auth().signIn(withEmail: email, password: password) {(Auth, error) in
            if (error == nil){
                UserDefaults.standard.set(username, forKey: "username")
                print(username)
                self.goToNextPage()
                } else{
                self.generateAlert(messageString: "Please try again. ")            }
        }

    }
    func generateAlert(messageString: String){
        let alert = UIAlertController(title: "Alert!", message: messageString, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK!", style: .default) { (action:UIAlertAction) in return}
        
        alert.addAction(action)
        self.present(alert, animated: false, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = AnimationView(frame: dummyFrame, messageString: "Now it's time to login. Please enter your username and password. ")
        view.addSubview(animation)

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

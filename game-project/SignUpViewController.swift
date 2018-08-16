//
//  SignUpViewController.swift
//  game-project
//
//  Created by Rohan Shah on 6/19/18.
//  Copyright © 2018 Rohan Shah. All rights reserved.
//
// this is the page where you sign up

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    
    let dummyFrame = CGRect(x: 0, y:0, width: 0, height: 0)
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    var highScores = Array<String>()
    @IBAction func goToCategory(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        
        //makes variable global
        let username = usernameTextField.text!
        UserDefaults.standard.set(username, forKey: "username")

        if (email == "" || password == "" || confirmPassword == "" || username == ""){
            generateAlert(messageString: "Please enter all text fields.")

        } else if (password != confirmPassword){
            generateAlert(messageString: "Password does not match.")

        }
            Auth.auth().createUser(withEmail: email, password: password){
                (User, error) in
               if error != nil {
                    // Handle the error (i.e notify the user of the error)

                    if let errCode = AuthErrorCode(rawValue: error!._code) {

                        switch errCode {
                        case .invalidEmail:
                            print("invalid email")
                        case .emailAlreadyInUse:
                            print("in use")

                        case .invalidCustomToken:
                            print("other error")
                        case .customTokenMismatch:
                            print("other error")
                        case .invalidCredential:
                            print("other error")
                        case .userDisabled:
                            print("other error")
                        case .operationNotAllowed:
                            print("other error")
                        case .wrongPassword:
                            print("other error")
                        case .tooManyRequests:
                            print("other error")
                        case .userNotFound:
                            print("other error")
                        case .accountExistsWithDifferentCredential:
                            print("other error")
                        case .requiresRecentLogin:
                            print("other error")
                        case .providerAlreadyLinked:
                            print("other error")
                        case .noSuchProvider:
                            print("other error")
                        case .invalidUserToken:
                            print("other error")
                        case .networkError:
                            print("other error")
                        case .userTokenExpired:
                            print("other error")
                        case .invalidAPIKey:
                            print("other error")
                        case .userMismatch:
                            print("other error")
                        case .credentialAlreadyInUse:
                            print("other error")
                        case .weakPassword:
                            self.generateAlert(messageString: "Password must have one symbol, capital letter, and number.")
                        case .appNotAuthorized:
                            print("other error")
                        case .expiredActionCode:
                            print("other error")
                        case .invalidActionCode:
                            print("other error")
                        case .invalidMessagePayload:
                            print("other error")
                        case .invalidSender:
                            print("other error")
                        case .invalidRecipientEmail:
                            print("other error")
                        case .missingEmail:
                            print("other error")
                        case .missingIosBundleID:
                            print("other error")
                        case .missingAndroidPackageName:
                            print("other error")
                        case .unauthorizedDomain:
                            print("other error")
                        case .invalidContinueURI:
                            print("other error")
                        case .missingContinueURI:
                            print("other error")
                        case .missingPhoneNumber:
                            print("other error")
                        case .invalidPhoneNumber:
                            print("other error")
                        case .missingVerificationCode:
                            print("other error")
                        case .invalidVerificationCode:
                            print("other error")
                        case .missingVerificationID:
                            print("other error")
                        case .invalidVerificationID:
                            print("other error")
                        case .missingAppCredential:
                            print("other error")
                        case .invalidAppCredential:
                            print("other error")
                        case .sessionExpired:
                            print("other error")
                        case .quotaExceeded:
                            print("other error")
                        case .missingAppToken:
                            print("other error")
                        case .notificationNotForwarded:
                            print("other error")
                        case .appNotVerified:
                            print("other error")
                        case .captchaCheckFailed:
                            print("other error")
                        case .webContextAlreadyPresented:
                            print("other error")
                        case .webContextCancelled:
                            print("other error")
                        case .appVerificationUserInteractionFailure:
                            print("other error")
                        case .invalidClientID:
                            print("other error")
                        case .webNetworkRequestFailed:
                            print("other error")
                        case .webInternalError:
                            print("other error")
                        case .nullUser:
                            print("other error")
                        case .keychainError:
                            print("other error")
                        case .internalError:
                            print("other error")

                        }

                }

                    

               }else {
                self.ref = Database.database().reference().child("leaderboard").child(self.usernameTextField.text!)
                self.ref.setValue(NSNumber(value: 0))
                self.goToNextPage()

               

                }
        
        }

    }
    func goToNextPage(){
        let leaderboardPage = self.storyboard?.instantiateViewController(withIdentifier: "leaderboardPage") as! LeaderboardViewController
        self.present(leaderboardPage, animated: false)
        
    }
    
    func generateAlert(messageString: String){
        let alert = UIAlertController(title: "Alert!", message: messageString, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK!", style: .default) { (action:UIAlertAction) in return}
        
        alert.addAction(action)
        self.present(alert, animated: false, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let animation = AnimationView(frame: dummyFrame, messageString: "Now it's time to sign-up. ")
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

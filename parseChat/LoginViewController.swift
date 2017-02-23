//
//  LoginViewController.swift
//  parseChat
//
//  Created by Jose-Rafael Diaz on 2/22/17.
//  Copyright © 2017 Jose-Rafael Diaz. All rights reserved.
//

import Parse
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var passTxtField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    
      let alertController = UIAlertController(title: "Email Required", message: "Please enter your email", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userSignUp() {
        let user = PFUser()
        user.username = emailTxtField.text
        user.password = passTxtField.text
        // other fields can be set just like with PFObject
        
        user.signUpInBackground(block: { (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                let errorString = error.localizedDescription as? NSString
                // Show the errorString somewhere and let the user try again.
                
                self.displayAlert("Login Failed", message: (errorString as? String)!)
                
            } else {
                // Hooray! Let them use the app now.
                
                self.performSegue(withIdentifier: "firstSegue", sender: self)
            }
        })

        
    }
    
    func userLogin() {
    
        var errorMessage = "Error Occurred"
        PFUser.logInWithUsername(inBackground: emailTxtField.text!, password: passTxtField.text!) {
            (user: PFUser?, error: Error?) -> Void in
            
            //            self.activityIndicator.stopAnimating()
            //            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            if user != nil {
                // Do stuff after successful login.
                self.performSegue(withIdentifier: "successfulLogin", sender: self)
                
            } else {
                // The login failed. Check error to see why.
                
                if let errorString = error!.localizedDescription as? String {
                    
                    errorMessage = errorString
                    
                }
                
                self.displayAlert("Login Failed", message: errorMessage)
                
            }
        }
    }
    
    @IBAction func onPresentChat(_ sender: UIButton) {
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }

    
    func displayAlert(_ title: String, message: String) {
        
        let alert = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.dismiss(animated: true, completion: nil)
        })))
        
        self.present(alert, animated: true, completion: nil)
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

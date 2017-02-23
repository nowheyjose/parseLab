//
//  ChatViewController.swift
//  parseChat
//
//  Created by Jose-Rafael Diaz on 2/22/17.
//  Copyright © 2017 Jose-Rafael Diaz. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet var chatMessageField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeMessage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
    }

    func storeMessage() {
        
        let message = PFObject(className:"Message")
        message["text"] = chatMessageField.text
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                print(message)
    
            } else {
                // There was a problem, check error.description
                
            }
        }
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

//
//  SignOnViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/20/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
class SignOnViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var confirmAndContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(Auth.auth().currentUser?.email)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        confirmAndContinue.isHidden = true
        
        if(Auth.auth().currentUser != nil){
            confirmAndContinue.isHidden = false
        }
        
    }
    

    
    
}

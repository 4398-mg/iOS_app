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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }

}

//
//  ParameterSelectionViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/19/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class ParameterSelectionViewController: UIViewController, DisplayViewControllerDelegate{
    
    @IBOutlet weak var genreLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func genreSelected(choice: String){
        genreLabel?.text = choice
        print(genreLabel.text ?? "nothing")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "genrePickerViewController"){
            let genreVC = segue.destination as! GenrePickerViewController
            genreVC.delegate = self
        }
    }
    
//    @IBAction func closeButtonTapped(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
}


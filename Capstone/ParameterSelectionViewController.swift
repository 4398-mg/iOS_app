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

protocol genreDelegate {
    func fillGenreLabel(genrePicked:String)
}

class ParameterSelectionViewController: UIViewController, genreDelegate{
    
    @IBOutlet weak var genreLabel:UILabel!
    @IBOutlet var tempoLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
//    @IBAction func closeButtonTapped(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    func fillGenreLabel(genrePicked:String){
        genreLabel.text = genrePicked
    }
    
    func fillTempoLabel(tempoPicked:String){
        tempoLabel.text = tempoPicked
    }
    
    func fillDurationLabel(durationPicked:String){
        durationLabel.text = durationPicked
    }
    
}


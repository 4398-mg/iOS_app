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
import Alamofire

class ParameterSelectionViewController: UIViewController, GenreDelegate, TempoDelegate, DurationDelegate{
    
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet weak var tempoLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
   
    var request : Request = Request()
    var rm = RestAPIManager()
    var email : String = ""
    var profileID : String = ""
    var historyCount: Int = 0
    var history = [songObj]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if GIDSignIn.sharedInstance()?.currentUser != nil{
            email = ((GIDSignIn.sharedInstance().currentUser.profile.email!) )
            
            profileID  = ((GIDSignIn.sharedInstance().currentUser.authentication.idToken!))
            
        }
       
        let parameters : Parameters =  [ "profileID" :  profileID , "profileEmail" : email ]
        
       
        if GIDSignIn.sharedInstance()?.currentUser != nil{
            rm.getHistory(parameters: parameters) { response in
                
                print(response[0].song_name)
                print(response[1].song_name)
                print(response[2].song_name)
                print(response[3].song_name)
                print(response[4].song_name)
                //  print(response.count)
              self.historyCount = response.count
                
              self.history.append(contentsOf: response)
                
                
            }
        
    }
    }
    
    
    
    @IBAction func logOutTapped(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    func fillGenreLabel(genrePicked:String){
        genreLabel.text = genrePicked
        request.genre = genrePicked
        
    }
    
    func fillTempoLabel(tempoPicked:String){
        tempoLabel.text = tempoPicked
        request.tempo = tempoPicked
    }
    
    func fillDurationLabel(durationPicked:String){
        durationLabel.text = durationPicked
        request.duration = durationPicked
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showGenrePicker"){
            if let genreVC = segue.destination as? GenrePickerViewController{
                genreVC.delegate = self
            }
        }else if(segue.identifier == "showTempoPicker"){
            if let tempoVC = segue.destination as? TempoPickerViewController{
                tempoVC.delegate = self
            }
        }else if(segue.identifier == "showDurationPicker"){
            if let durationVC = segue.destination as? DurationPickerViewController{
                durationVC.delegate = self
            }
        }
        guard let playerViewController = segue.destination as? PlayerViewController
            else{
                return
        }
            playerViewController.request = request
            playerViewController.history = history
        
    }
}




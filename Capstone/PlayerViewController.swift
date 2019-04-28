//
//  PlayerViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/31/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire
import GoogleSignIn



class PlayerViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
 
    

    
    
    
  

    var rm = RestAPIManager()
    var audioPlayer : AVPlayer?
    var playerItem : AVPlayerItem?
    var request : Request?
    var currentSongIndex : Int?
    
    var email : String = ""
    var profileID : String = ""
  //  var historyCount: Int = 0
    var history = [songObj]()

    
    
    let cellReuseIdentifier = "cell"
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var  songName  : UILabel!
    @IBOutlet weak var  songGenre : UILabel!
    @IBOutlet weak var  songTempo : UILabel!
    
    @IBOutlet weak var editSongTB: UITextField!
    @IBOutlet weak var editButton : UIButton!
    @IBOutlet weak var saveButton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editSongTB.isEnabled = false
        editSongTB.isHidden = true
        saveButton.isHidden = true
        
      //  var historyCount: Int = 0
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        if GIDSignIn.sharedInstance()?.currentUser != nil{
            email = ((GIDSignIn.sharedInstance().currentUser.profile.email!) )
      
            profileID  = ((GIDSignIn.sharedInstance().currentUser.authentication.idToken!))
            
        }

      
        

        //let profileID  = (GIDSignIn.sharedInstance()?.currentUser.authentication.idToken!)
        
        let parameters : Parameters =  [ "profileID" :  profileID , "profileEmail" :  email , "genre" : request!.genre, "tempo" : request!.tempo, "duration" : request!.duration ]
        print("playerVC parameters")
        print(parameters)
  
        
        if ( request?.genre != "" && request?.tempo != "" && request?.duration != ""){
        rm.generateSong( parameters: parameters ) { response in
            
            //song = JSON(response)["location"].stringValue
            let url = URL(string: response.location)
            let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
            self.audioPlayer = AVPlayer(playerItem: playerItem)
            self.songName.text = response.song_name
            self.songGenre.text = response.genre
            self.songTempo.text = response.tempo
            self.history.append(response)
            self.currentSongIndex = self.history.count - 1
            self.tableView.reloadData()
        }
        }
        
 
        // Do any additional setup after loading the view.
   
   
     if GIDSignIn.sharedInstance()?.currentUser != nil{
         rm.getHistory(parameters: parameters) { response in
        
         
          //  print(response.count)
           //historyCount = response.count
            
          // history.append(contentsOf: response)
            
            
            }

 
            
        
        
            print("historyCount: \(history[5].song_name)")
    }
        
  

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = history[indexPath.row].song_name
        
        return cell
    }
  
    // song tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: history[indexPath.row].location)
        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        self.audioPlayer = AVPlayer(playerItem: playerItem)
        self.songName.text = history[indexPath.row].song_name
        self.songGenre.text = history[indexPath.row].genre
        self.songTempo.text = history[indexPath.row].tempo
        currentSongIndex = indexPath.row
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Intentionally blank in order to be able to use UITableViewRowActions
    }
    
    
    
    
    @IBAction func play(_ sender: Any) {
       
        audioPlayer!.play()
    
    }
    
    @IBAction func pause(_ sender: Any) {
        
        audioPlayer!.pause()
        
    }
    
    @IBAction func restart(_ sender: Any){
     
        audioPlayer!.play()
        
    }
       // print(historyCount)
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let handler: UIContextualAction.Handler = { (action: UIContextualAction, view: UIView, completionHandler: ((Bool) -> Void)) in
            self.history.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        let deleteAction = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Delete", handler: handler)
        // Add more actions here if required
        
        let deleteParam : Parameters =  [ "profileID" :  profileID , "profileEmail" :  email ,
                                             "songID" : self.history[indexPath.row].song_id ]
        
        
        rm.deleteSong(parameters: deleteParam){ response in
            
            print(response)
            print(self.history.count)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }

        @IBAction func editTapped(){
            
            
            
            
            editSongTB.isEnabled = true
            editSongTB.isHidden = false
            editSongTB.text = songName.text
            editButton.isHidden = true
            saveButton.isHidden = false
            
            
        }
    
    @IBAction func saveTapped(){

        editSongTB.isEnabled = false
        editSongTB.isHidden = true
        songName.text = editSongTB.text
        self.history[currentSongIndex!].song_name = editSongTB.text!
        
        
        let editParam : Parameters =  [ "profileID" :  profileID , "profileEmail" :  email ,
                                        "newName" : editSongTB.text! , "songID" : self.history[currentSongIndex!].song_id ]
        
        rm.editSong(parameters: editParam) {response in
            
            print(response)
            
        }
        
        
        editButton.isHidden = false
        saveButton.isHidden = true
        
        self.tableView.reloadData()
    }
    
    
}




/*
 
 
 let deleteParam : Parameters =  [ "profileID" :  profileID , "profileEmail" :  email , "songID" : self.history[indexPath.row].song_id ]
 rm.deleteSong(parameters: deleteParam){ response in
 
 print(response)
 print(self.history.count)
 }
 
 
 
 */

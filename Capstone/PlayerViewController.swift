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

class PlayerViewController: UIViewController {

    var rm = RestAPIManager()
    var audioPlayer : AVPlayer?
    var playerItem : AVPlayerItem?
    var request : Request?
    @IBOutlet weak var  songName  : UILabel!
    @IBOutlet weak var  songGenre : UILabel!
    @IBOutlet weak var  songTempo : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parameters : Parameters =  [ "genre" : request!.genre, "tempo" : request!.tempo, "duration" : request!.duration ]
        print("playerVC parameters")
        print(parameters)
        rm.generateSong( parameters: parameters ) { response in
            
            //song = JSON(response)["location"].stringValue
            let url = URL(string: response.location)
            let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
            self.audioPlayer = AVPlayer(playerItem: playerItem)
            self.songName.text = response.song_name
            self.songGenre.text = response.genre
            self.songTempo.text = response.tempo
        }
        // Do any additional setup after loading the view.
    
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
    
}


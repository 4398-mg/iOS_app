//
//  PlayerViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/31/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    var rm = RestAPIManager()
    var audioPlayer : AVPlayer?
    var playerItem : AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        rm.getSong() { response in
            
            //song = JSON(response)["location"].stringValue
            let url = URL(string: response)
            let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
            self.audioPlayer = AVPlayer(playerItem: playerItem)
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


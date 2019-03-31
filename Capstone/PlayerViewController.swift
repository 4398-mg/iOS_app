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

    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "The Big Country", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }catch{
            print(error)
        }
    }
    
    @IBAction func play(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        if(audioPlayer.isPlaying){
            audioPlayer.pause()
        }
    }
    
    @IBAction func restart(_ sender: Any){
            audioPlayer.currentTime = 0
    }
    
}


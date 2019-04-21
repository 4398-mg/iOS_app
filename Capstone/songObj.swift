//
//  songObj.swift
//  Capstone
//
//  Created by Anas Kabbani on 4/12/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import Foundation


 class songObj {
   
    var duration : String
    var genre : String
    var location : String
    var song_id: String
    var tempo: String
    var timeStamp: String
    var song_name: String
    
    init(){
        self.duration = ""
        self.genre = ""
        self.location = ""
        self.song_id = ""
        self.tempo = ""
        self.timeStamp = ""
        self.song_name = ""
    }
    
    func getSong() -> String {
       
        return self.song_name
    }
    
  
    
}

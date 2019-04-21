//
//  RestAPIManager.swift
//  Capstone
//
//  Created by Anas Kabbani on 3/18/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


typealias ServiceResponse = (JSON, Error?) -> Void

class RestAPIManager: NSObject {

    
    
    func generateSong(parameters : Parameters ,completionHandler:( @escaping (songObj) -> Void) ) {
        let song : songObj = songObj()
        
       // let parameters: Parameters = ["genre" : "folk", "tempo" : "slow", "duration" : "short"]
        print("generate song : ")
        print(parameters)
        
        Alamofire.request("http://api.thewimbo.me/generate_song", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                print(JSON(json)["location"])//print link
                // song = JSON(json)["location"].stringValue
                song.location = JSON(json)["location"].stringValue
                song.duration = JSON(json)["duration"].stringValue
                song.tempo = JSON(json)["tempo"].stringValue
                song.song_id = JSON(json)["song_id"].stringValue
                song.song_name = JSON(json)["song_name"].stringValue
                song.timeStamp = JSON(json)["timestamp"].stringValue
                song.genre = JSON(json)["genre"].stringValue
                
                
                completionHandler(song)
            }
            
            
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
            
            
            
        }
    }
    
    
    
    
    func getHistory(parameters : Parameters ,completionHandler:( @escaping ( [songObj] ) -> Void) )  {
    
        var history = [songObj]()

     
        print(parameters)
        
      Alamofire.request("http://api.thewimbo.me/history", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
        
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            
            
            if let json = response.result.value  {
                print("JSON: \(json)") // serialized json response
                
                
                var n = 0
                for _ in JSON(json)["history"] {
                    
                let song = songObj.init()
                song.location = JSON(json)["history"][n]["location"].stringValue
                song.duration = JSON(json)["history"][n]["duration"].stringValue
                song.tempo = JSON(json)["history"][n]["tempo"].stringValue
                song.song_id = JSON(json)["history"][n]["song_id"].stringValue
                song.timeStamp = JSON(json)["history"][n]["timestamp"].stringValue
                song.genre = JSON(json)["history"][n]["genre"].stringValue
                  
                    song.song_name = JSON(json)["history"][n]["song_name"].stringValue
                    print("song_name \(n) : \(JSON(json)["history"][n]["song_name"].stringValue)")

                
                    history.append(song)
                    n += 1
                }
            }
         completionHandler(history)
        }
    
        
    
    
    }
    
    
    
    
    
    func deleteSong(parameters : Parameters ,completionHandler:( @escaping ( String ) -> Void) )  {
        
        //var history = [songObj]()
        
        
        print(parameters)
        
        Alamofire.request("http://api.thewimbo.me/remove_song", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            
            
            if let json = response.result.value  {
                print("JSON: \(json)") // serialized json response
                
                
         
            }
            completionHandler(response.result.description)
        }
    }
    
    func editSong(parameters: Parameters, completionHandler: ( @escaping (String)-> Void)){
        
     
        
        Alamofire.request("http://api.thewimbo.me/edit_song", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            
            
            if let json = response.result.value  {
                print("JSON: \(json)") // serialized json response
                
                
                
            }
            completionHandler(response.result.description)
        }
        
    }
    
    
    /*
    static let SharedInstance = RestAPIManager()
    let baseURL = "http://api.thewimbo.me/"
    
                                                            ///endpoint: String
    func getResponse(onCompletion: @escaping (JSON) -> Void) {
        
        let route = baseURL 
        makeHTTPGetRequest(path: route) { (json: JSON, error: Error?) in
            onCompletion(json as JSON)
            
        }
        
        
    }
    
    //Perform GET Request
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse){
        //using url and request getting a json
        let request = URLRequest(url: NSURL(string: path)! as URL)
        URLSession.shared.dataTask(with: request)  {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let jsonData = data { //if data has something , try:
                do{
                    let json: JSON = try JSON(data: jsonData)
                    onCompletion(json, nil)
                }catch { //error
                    onCompletion(JSON(), error)
                }
                
            } else { //if data is nil
                onCompletion(JSON(), error)
                print("nil")
            }
        
        }.resume()
    }
    
    //perform POST
    
    private func makeHTTPPostRequest ( path : String, body:[String: AnyObject], onCompletion: @escaping ServiceResponse) {
        
        var request = URLRequest(url: NSURL(string: path)! as URL )
        request.httpMethod = "POST"
        
        do{
            let jsonBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            request.httpBody = jsonBody
            URLSession.shared.dataTask(with: request) { (data:Data?, response: URLResponse?, error: Error? ) in
                if let jsonData = data{
                    do{
                        let json:JSON = try JSON(data: jsonData)
                        onCompletion(json, nil)
                        
                    }catch {
                        onCompletion(JSON(), error)
                    }
                }else{
                    onCompletion(JSON(), error)
                }
            }.resume()
        }catch {
            onCompletion(JSON(), nil)
        }
    }
    */
    
    

}

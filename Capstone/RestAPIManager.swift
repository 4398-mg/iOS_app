//
//  RestAPIManager.swift
//  Capstone
//
//  Created by Anas Kabbani on 3/18/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import SwiftyJSON


typealias ServiceResponse = (JSON, Error?) -> Void

class RestAPIManager: NSObject {

    static let SharedInstance = RestAPIManager()
    let baseURL = "http://3.16.26.98:1337"
    
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
    
    
}

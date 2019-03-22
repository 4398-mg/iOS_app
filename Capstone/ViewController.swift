//
//  ViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/17/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var genreInput: UITextField!
    @IBOutlet weak var tempoInput: UITextField!
    @IBOutlet weak var durationInput: UITextField!
    
    let genres = ["jazz", "rock", "pop"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //pickerView.delegate = self
        //pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    @IBOutlet weak var endpointInput : UITextField!
    @IBOutlet weak var responseField : UITextView!
    var items = [responseObject]()
    var response : String = ""
    //var endpoints : Dictionary<String, Any>
    
    
    @IBAction func getResponseTapped(sender: UIButton){
            responseField.text = "get response tapped"
        RestAPIManager.SharedInstance.getResponse { (json:JSON) in
            self.response = json.description
        }
            
            
            
    
            responseField.text = response
        
        }
    
                
        

    }
    
    
        //responseField.text = "results"
    
    
    

    




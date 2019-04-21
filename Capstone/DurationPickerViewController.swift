//
//  DurationPickerViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/19/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import Foundation
protocol DurationDelegate {
    func fillDurationLabel(durationPicked:String)
}

class DurationPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var durationPicker: UIPickerView!
    var durationOptions = [ "short", "medium", "long" ]
   
  

    var durationChoice:String = ""
    var delegate:DurationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        durationPicker.delegate = self
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
  
        delegate?.fillDurationLabel(durationPicked: durationChoice)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      
            return durationOptions.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component:Int)->String?{
     
            return durationOptions[row]
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        durationChoice = durationOptions[row]
    }
    
    
}

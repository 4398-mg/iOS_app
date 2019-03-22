//
//  DurationPickerViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/19/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
import Foundation

class DurationPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var durationPicker: UIPickerView!
    var minNums = [String]()
    var min = [String]()
    var secNums = [String]()
    var sec = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        minNums = ["0", "1", "2", "3", "4", "5"]
        min = ["min"]
        for i in 0...59{
            secNums.append(String(i))
        }
        sec = ["sec"]
        
        durationPicker.delegate = self
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return minNums.count
        }else if(component == 1){
            return min.count
        }else if(component == 2){
            return secNums.count
        }else{
            return sec.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component:Int)->String?{
        if component == 0{
            return minNums[row]
        }else if(component == 1){
            return min[row]
        }else if(component == 2){
            return secNums[row]
        }else{
            return sec[row]
        }
    }
    
    
}

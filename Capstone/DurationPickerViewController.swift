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
    var minNums = ["0", "1", "2", "3", "4", "5"]
    var min = ["min"]
    var secNums = [String]()
    var sec = ["sec"]
    var minChoice:String = ""
    var secChoice:String = ""
    var durationChoice:String = ""
    var delegate:DurationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...59{
            secNums.append(String(i))
        }
        durationPicker.delegate = self
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print(minChoice)
        print(secChoice)
        delegate?.fillDurationLabel(durationPicked: durationChoice)
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
            minChoice = minNums[row]
            return minNums[row]
        }else if(component == 1){
            return min[row]
        }else if(component == 2){
            secChoice = secNums[row]
            return secNums[row]
        }else{
            return sec[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(Int(secChoice) ?? 0 < 10){
            durationChoice = "\(minChoice):0\(secChoice)"
        }else{
            durationChoice = "\(minChoice):\(secChoice)"
        }
    }
    
    
}

//
//  TempoPickerViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/19/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit

protocol TempoDelegate {
    func fillTempoLabel(tempoPicked:String)
}

class TempoPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let tempos = [ "slow", "medium", "fast"]
    var tempoChoice:String = ""
    @IBOutlet weak var tempoPicker: UIPickerView!
    var delegate:TempoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempoPicker.delegate = self
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        delegate?.fillTempoLabel(tempoPicked: tempoChoice)
        print(tempoChoice)
    }

    func numberOfComponents(in pickerView: UIPickerView)-> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tempos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tempoChoice = tempos[row]
    }
    

}

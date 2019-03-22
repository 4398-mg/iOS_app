//
//  TempoPickerViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/19/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit

class TempoPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let tempos = ["1", "2", "3", "4", "5"]
    var tempoChoice:String = ""
    @IBOutlet weak var tempoPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempoPicker.delegate = self
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func numberOfComponents(in pickerView: UIPickerView)-> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        tempoChoice = tempos[row]
        return tempos[row]
    }
    

}

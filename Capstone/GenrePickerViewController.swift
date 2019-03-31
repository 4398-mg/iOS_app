//
//  GenrePickerViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/19/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit
protocol DisplayViewControllerDelegate:NSObjectProtocol{
    func genreSelected(choice:String)
}
var genreChoice:String = ""
class GenrePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    let genres = ["", "blues", "classical", "country", "electronic", "folk", "jazz", "pop", "rock"]
    @IBOutlet weak var genrePicker:UIPickerView!
    weak var delegate:DisplayViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        genrePicker.delegate = self
    }
    
    @IBAction func closeButtonTapped(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
        print(genreChoice)
        if let delegate = delegate{
            delegate.genreSelected(choice: genreChoice)
        }
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genreChoice = genres[row]
    }
    
}

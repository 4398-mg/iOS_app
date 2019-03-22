//
//  ParameterSelectionViewController.swift
//  Capstone
//
//  Created by Mary Cosentini on 3/19/19.
//  Copyright © 2019 Mary Cosentini. All rights reserved.
//

import UIKit

class ParameterSelectionViewController: UIViewController, DisplayViewControllerDelegate{
    
    @IBOutlet weak var genreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func genreSelected(choice: String){
        genreLabel?.text = choice
        print(genreLabel.text ?? "nothing")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "genrePickerViewController"){
            let genreVC = segue.destination as! GenrePickerViewController
            genreVC.delegate = self
        }
    }

}

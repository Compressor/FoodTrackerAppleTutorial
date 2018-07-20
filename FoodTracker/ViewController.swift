//
//  ViewController.swift
//  FoodTracker
//
//  Created by vitali on 7/19/18.
//  Copyright © 2018 vitcopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties

    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameEdit: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealNameEdit.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDeleate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}


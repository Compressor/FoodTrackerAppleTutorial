//
//  ViewController.swift
//  FoodTracker
//
//  Created by vitali on 7/19/18.
//  Copyright © 2018 vitcopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties

    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameEdit: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
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
    
    //MARK: UIImagePickControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image.")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
        
        
    }
    
    //MARK: Actions
    
    @IBAction func selectImageFromGallery(_ sender: UITapGestureRecognizer) {
        mealNameEdit.resignFirstResponder()
        let imagePickController = UIImagePickerController()
        imagePickController.sourceType = .photoLibrary
        imagePickController.delegate = self
        present(imagePickController, animated: true, completion: nil)
        
        
    }
}


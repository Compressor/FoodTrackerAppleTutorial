//
//  ViewController.swift
//  FoodTracker
//
//  Created by vitali on 7/19/18.
//  Copyright © 2018 vitcopr. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties

    @IBOutlet weak var mealNameEdit: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealNameEdit.delegate = self
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: PrivateMethods
    
    private func updateSaveButtonState(){
        let text = mealNameEdit.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    //MARK: UITextFieldDeleate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
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
    
    //MARK: Navigation
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, canceling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = mealNameEdit.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        meal = Meal(name: name, photo: photo, rating: rating)
        
    }
}


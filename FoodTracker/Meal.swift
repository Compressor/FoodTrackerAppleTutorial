//
//  Meal.swift
//  FoodTracker
//
//  Created by vitali on 7/22/18.
//  Copyright © 2018 vitcopr. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int){
        
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
    
}

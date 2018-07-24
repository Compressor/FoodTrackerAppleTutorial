//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by vitali on 7/22/18.
//  Copyright © 2018 vitcopr. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var mealPhoto: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealRating: RatingControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

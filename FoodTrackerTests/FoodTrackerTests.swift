//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by vitali on 7/19/18.
//  Copyright © 2018 vitcopr. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: Meal Class Tests
    
    func testMealInitialization(){
        let zeroRatingMeal = Meal.init(name: "Test",  photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        let negativeRatingMeal = Meal.init(name: "NegativeRating", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
    }
    
}

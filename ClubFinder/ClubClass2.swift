//
//  ClubClass.swift
//  ClubFinder
//
//  Created by Sunil Green on 4/23/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import Foundation

class SecondClub {
    var school: String?
    var name: String?
    var description: String?
    var image_url: String?
    var username: [String]
    var reviews: [String]
    var ratings: [Double]
    var avg_rating: Double
    init(school: String, name: String, description: String, image_url: String, username: [String], reviews: [String], ratings: [Double], avg_rating: Double) {
        self.school = school
        self.name = name
        self.description = description
        self.image_url = image_url
        self.username = username
        self.reviews = reviews
        self.ratings = ratings
        self.avg_rating = avg_rating
    }
    
}


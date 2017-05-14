//
//  Restaurant.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 3/1/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var profession = ""
//    var type = ""
    var location = ""
    var image = ""
    var phoneNumber = ""
    var rating = ""
    var isVisited = false
    
    init(name: String, profession: String, location: String, phoneNumber: String,image: String, rating: String, isVisited: Bool) {
        self.name = name
//        self.type = type
        self.location = location
        self.phoneNumber = phoneNumber
        self.image = image
        self.rating = rating
        self.isVisited = isVisited
    }
}

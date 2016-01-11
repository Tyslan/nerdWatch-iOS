//
//  Movie.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 11/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie {
    var _id: String
    var title: String
    var year: String
    var description: String
    var upvotes:Int
    
    init (_id:String, title:String, year:String, description:String, upvotes:Int){
        self._id = _id
        self.title = title
        self.year = year
        self.description = description
        self.upvotes = upvotes
    }    
}
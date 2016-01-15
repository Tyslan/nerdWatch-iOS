//
//  Movie.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 11/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import Foundation
import RealmSwift

class Movie: Object {
    dynamic var _id: String = ""
    dynamic var title: String = ""
    dynamic var year: String = ""
    dynamic var movieDescription: String = ""
    dynamic var upvotes: Int = 0
    dynamic var contributor: String = ""
    
    convenience init (_id:String, title:String, year:String, description:String, upvotes:Int, contributor:String){
        self.init()
        self._id = _id
        self.title = title
        self.year = year
        self.movieDescription = description
        self.upvotes = upvotes
        self.contributor = contributor
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}
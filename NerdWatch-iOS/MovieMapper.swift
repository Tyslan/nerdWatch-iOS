//
//  MovieMapper.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 11/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieMapper
{
    static func jsonToMovie(json:JSON) -> Movie
    {
        let _id = json["_id"].string!
        let title = json["title"].string!
        let year = json["year"].string!
        let description = json["description"].string!
        let votes = json["upvotes"].int!
        
        let movie = Movie(_id: _id, title: title, year: year, description: description, upvotes: votes)
        movie.show()
        return movie
    }
}
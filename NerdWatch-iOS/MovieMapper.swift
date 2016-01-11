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
        let _id = json["_id"].stringValue
        let title = json["title"].stringValue
        let year = json["year"].stringValue
        let description = json["description"].stringValue
        let votes = json["upvotes"].int!
        let contributor = json["contributor"].stringValue
        
        return Movie(_id: _id, title: title, year: year, description: description, upvotes: votes, contributor: contributor)
    }
}
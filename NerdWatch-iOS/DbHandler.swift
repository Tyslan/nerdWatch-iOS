//
//  DbHandler.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 15/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import RealmSwift

class DbHandler
{
    
    
    static func writeMovieArrayToDB(movies: [Movie])
    {
        let realm = try! Realm()
        
        for movie in movies{
            try! realm.write {
                realm.add(movie)
            }
        }
    }
    
}
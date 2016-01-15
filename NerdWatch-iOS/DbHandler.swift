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
    static let realm = try! Realm()
    
    static func getAllMovies() -> Void
    {
        let movies = self.realm.objects(Movie)
    }
    
    static func writeMovieArrayToDB(movies: [Movie])
    {
        for movie in movies{
            try! realm.write {
                realm.add(movie)
            }
        }
    }
    
    static func updateMovie(movie: Movie)
    {
        let votes = movie.upvotes + 1
        try! realm.write {
            realm.create(Movie.self, value: ["id": movie._id, "upvotes": votes], update: true)
            try! realm.commitWrite()
        }
    }
    
    static func addMovie(movie: Movie)
    {
        try! realm.write {
            realm.add(movie)
        }
    }
    
    static func clearMovieDB()
    {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
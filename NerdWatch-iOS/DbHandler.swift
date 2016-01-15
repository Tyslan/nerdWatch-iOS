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
    
    static func getAllMovies() -> [Movie]
    {
        let moviesResult = self.realm.objects(Movie)
        
        var movies:[Movie] = []
        
        for movie in moviesResult
        {
            movies.append(movie)
        }
        
        return movies
    }
    
    static func writeMovieArrayToDB(movies: [Movie])
    {
        for movie in movies{
            try! realm.write {
                realm.add(movie)
            }
        }
    }
    
    static func addMovie(movie: Movie)
    {
        try! realm.write {
            realm.add(movie)
        }
    }
    
    static func upvoteMovie(movie: Movie)
    {
        try! realm.write {
            movie.upvotes += 1
            realm.add(movie, update: true)
        }
    }
    
    static func clearMovieDB()
    {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
//
//  MovieListController.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 11/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieListController : UITableViewController
{
    var movies: [Movie] = []
    let baseUrl = "https://lorenzverschingel.herokuapp.com/api/movies/"
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        Alamofire.request(.GET, baseUrl)
            .responseJSON { response in
                if let json = response.result.value
                {
                    let movieJSON = JSON(json).arrayValue
                    
                    for obj in movieJSON {
                        self.movies.append(MovieMapper.jsonToMovie(obj))
                    }
                    
                    self.movies.sortInPlace {
                        return $0.upvotes > $1.upvotes
                    }
                    
                    self.tableView.reloadData()
                }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)
        cell.textLabel!.text! = movie.title
        cell.detailTextLabel!.text! = "\(movie.upvotes)"
        return cell
    }

}
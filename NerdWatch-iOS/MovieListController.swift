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
import JLToast
import RealmSwift

class MovieListController : UITableViewController
{
    var movies:[Movie] = []
    var movie: Movie!
    let baseUrl = "https://lorenzverschingel.herokuapp.com/api/movies/"
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        print(Realm.Configuration.defaultConfiguration.path!)
        refresh()
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "showDetail":
            let detail = (segue.destinationViewController as! UINavigationController).topViewController as! MovieViewController
            let selectedMovie = movies[tableView.indexPathForSelectedRow!.row]
            detail.movie = selectedMovie
        default:
            break
        }
    }
    
    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
        let movieViewController = segue.sourceViewController as! MovieViewController
        if let result = movieViewController.result {
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            switch result {
            case .Voted:
                let movie = movies[selectedIndex]
                movie.upvotes += 1
                
                let url = baseUrl + movie._id + "/upvote"
                Alamofire.request(.PUT, url)
                
                DbHandler.updateMovie(movie)
                
                tableView.reloadRowsAtIndexPaths([tableView.indexPathForSelectedRow!], withRowAnimation: .Automatic)
                JLToast.makeText("Voted for: \(movie.title)", duration: JLToastDelay.LongDelay).show()
            }
        }
    }
    
    @IBAction func unwindFromAdd(segue: UIStoryboardSegue) {
        let movieViewController = segue.sourceViewController as! AddViewController
        if let newMovie = movieViewController.movie {
            tableView.beginUpdates()
            movies.append(newMovie)
            tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: movies.count - 1, inSection: 0)], withRowAnimation: .Automatic)
            movie = newMovie
            let movieJSON = ["title": movie.title, "year": movie.year, "description": movie.description, "contributor": movie.contributor]
            Alamofire.request(.POST, baseUrl , parameters: movieJSON, encoding: .JSON)
                .responseJSON { response in
                    if let json = response.result.value
                    {
                        let movieJSON = JSON(json)
                        self.movie._id = movieJSON["_id"].stringValue
                    }
                }
            JLToast.makeText("\(movie.title) added", duration: JLToastDelay.LongDelay).show()
            tableView.endUpdates()
        }
    }
    
    @IBAction func RefreshList(){
        refresh()
    }
    
    func refresh() {
        movies = []
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
                    
                    DbHandler.writeMovieArrayToDB(self.movies)
                }
            }
    }
}
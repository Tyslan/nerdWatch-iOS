//
//  ViewController.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 11/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    enum Result
    {
        case Voted
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    
    var movie:Movie!
    var result:Result?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        self.descriptionLabel.text = movie.description
        self.yearLabel.text = movie.year
        self.votesLabel.text = "\(movie.upvotes)"
        self.title = movie.title
    }
    
    @IBAction func voteUp() {
        self.result = Result.Voted
        performSegueWithIdentifier("voted", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


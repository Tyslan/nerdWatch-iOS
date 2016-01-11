//
//  ViewController.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 11/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var id:String = "5661e8e348b1443901f26b92"
    let baseUrl = "https://lorenzverschingel.herokuapp.com/api/movies/"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = baseUrl + id
        
        Alamofire.request(.GET, url)
            .responseJSON { response in
                if let json = response.result.value
                {
                    let movieJSON = JSON(json)
                    self.titleLabel.text = movieJSON["title"].string
                    self.descriptionLabel.text = movieJSON["description"].string
                    self.yearLabel.text = movieJSON["year"].string
                    print(movieJSON)
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


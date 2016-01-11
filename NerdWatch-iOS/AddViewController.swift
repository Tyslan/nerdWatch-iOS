//
//  AddViewController.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 11/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import UIKit

class AddViewController: UITableViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    
    var movie:Movie?
    
    @IBAction func save() {
        if let title = titleField.text where title.characters.count > 1 {
            let year = yearField.text!
            let description = descriptionField.text
            movie = Movie(_id: "", title: title, year: year, description: description, upvotes: 0)
            performSegueWithIdentifier("added", sender: self)
        }
    }
    
}
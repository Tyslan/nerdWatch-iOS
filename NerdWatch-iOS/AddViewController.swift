//
//  AddViewController.swift
//  NerdWatch-iOS
//
//  Created by Lorenz Verschingel on 11/01/16.
//  Copyright © 2016 Lorenz Verschingel. All rights reserved.
//

import UIKit
import JLToast

class AddViewController: UITableViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var contibutorField: UITextField!
    
    var movie:Movie?
    
    @IBAction func save() {
        if let title = titleField.text where title.characters.count > 1 {
            let year = yearField.text!
            let description = descriptionField.text
            let contributor = contibutorField.text!
            movie = Movie(_id: "", title: title, year: year, description: description, upvotes: 0, contributor: contributor)
            performSegueWithIdentifier("added", sender: self)
        } else {
            JLToast.makeText("Some fields are still empty", duration: JLToastDelay.LongDelay).show()
        }
    }
    
}
//
//  DetailViewController.swift
//  MovieList
//
//  Created by Inga Kirsona on 03/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    
    var movieName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if movieName != nil {
            movieImage.image = UIImage(named: movieName)
            movieNameLabel.text = movieName
            movieNameLabel.numberOfLines = 0
        }
    }
}

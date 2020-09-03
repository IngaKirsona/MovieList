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
    
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if movie != nil {
            movieImage.image = UIImage(named: movie.poster)
            movieNameLabel.text = movie.movie
            movieNameLabel.numberOfLines = 0
        }
    }
}

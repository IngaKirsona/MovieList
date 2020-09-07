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
    
    
    var movieTrack: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.layer.cornerRadius = 30
        if movieTrack != nil {
            movieImage.image = UIImage(named: movieTrack.poster)
            movieNameLabel.text = movieTrack.movie
            movieNameLabel.numberOfLines = 0
            movieYearLabel.text = movieTrack.movieYear
        }
    }
}

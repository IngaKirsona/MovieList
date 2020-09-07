//
//  MusicDetailViewController.swift
//  MovieList
//
//  Created by Inga Kirsona on 07/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class MusicDetailViewController: UIViewController {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    var song: Song!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if song != nil {
            trackImageView.image = UIImage(named: song.cover)
            trackNameLabel.text = song.track + " - " + song.album
            trackNameLabel.numberOfLines = 0
        }
    }
    
}

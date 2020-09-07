//
//  InfoViewController.swift
//  MovieList
//
//  Created by Inga Kirsona on 07/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var appInfoLabel: UILabel!
    
    let appInfoText = "This is my homework project.\n Check the music and my favorite movies!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        appInfoLabel.text = appInfoText
        if !appInfoText.isEmpty{
            appInfoLabel.text = appInfoText
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("Dismiss View Controller")
    }
    
}

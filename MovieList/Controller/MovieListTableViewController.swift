//
//  MovieListTableViewController.swift
//  MovieList
//
//  Created by Inga Kirsona on 03/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    var movies = Movie.createMovie()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

//-------pievienot tabulai attelus
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath)
    
        let movie = movies [indexPath.row]
        cell.textLabel?.text = movie.movie
        cell.detailTextLabel?.text = movie.movieYear
        cell.imageView?.image = UIImage(named: movie.poster)
        return cell
        
    }
    
//-------pievienot rindai noteiktu augstumu
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//------- lai nospiezot edit varetu filmas parkartot
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentTrack = movies.remove(at: fromIndexPath.row)
        movies.insert(currentTrack, at: to.row)
    }

//------ lai nospiezot edit nebutu redzama delete ikona
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    // MARK: - Navigation
//-------lai parsutiti movie datus uz nakamo logu
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//-------lai redzetu kurs attels pec kartas tiek izvelets
        if let indexPath = tableView.indexPathForSelectedRow{
            print(indexPath.row)
            let detailVC = segue.destination as! DetailViewController
            detailVC.movieTrack = movies[indexPath.row]
            
        }
    }


}

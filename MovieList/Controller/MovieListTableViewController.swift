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
    
    //-------to add image and text to the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath)
        
        let movie = movies [indexPath.row]
        cell.textLabel?.text = movie.movie
        cell.detailTextLabel?.text = movie.movieYear
        cell.imageView?.image = UIImage(named: movie.poster)
        return cell
        
    }
    
    //-------format row hight
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //-------to rearange cells clicking on eddit
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentTrack = movies.remove(at: fromIndexPath.row)
        movies.insert(currentTrack, at: to.row)
    }
    
    // MARK: - Navigation
    //-------to send movie data on other view
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //-------to see witch cell is chosen
        if let indexPath = tableView.indexPathForSelectedRow{
            print(indexPath.row)
            let detailVC = segue.destination as! DetailViewController
            detailVC.movieTrack = movies[indexPath.row]
            
        }
    }
    
    //-------to enable delete option
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Are You sure you want to delete?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (_) in
                self.movies.remove(at: indexPath.row)
                UIView.transition(with: tableView, duration: 1.0, options: .transitionCrossDissolve, animations: {
                    self.tableView.reloadData()
                }, completion: nil)
            }))
            self.present(alert, animated: true)
        }
    }
    
    
}

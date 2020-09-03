//
//  MovieListTableViewController.swift
//  MovieList
//
//  Created by Inga Kirsona on 03/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

//    var movieList = [
//    "The Great Gatsby - 2013",
//    "Daddy's Home - 2015",
//    "Daddy's Home 2 - 2017",
//    "Sound of Music - 1965",
//    "Focus - 2015",
//    "Pacific Rim Uprising - 2018",
//    "Guardians of the Galaxy Vol. 2  - 2017",
//    "Grown Ups 2 - 2013",
//    "Gravity - 2013",
//    "Avatar - 2009",
//    "47 Meters Down - 2017",
//    "Doctor Strange - 2016"
//    ]
    
    var movies = Movie.createMovie()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
//-------lai parsutiti movie datus uz nakamo logu
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//-------lai redzetu kurs attles pec kartas tiek izvelets
        if let indexPath = tableView.indexPathForSelectedRow{
            print(indexPath.row)
            let detailVC = segue.destination as! DetailViewController
            detailVC.movie = movies[indexPath.row]
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}

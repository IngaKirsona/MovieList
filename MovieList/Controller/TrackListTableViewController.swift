//
//  TrackListTableViewController.swift
//  TrackList_Teacher
//
//  Created by Inga Kirsona on 03/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class TrackListTableViewController: UITableViewController {
    
//        var trackList = [
//            "Carly Rae Japsen - Dedicated",
//            "Dj Khaled - father of",
//            "Injury Reserve - Jailbrake",
//            "Jonas Brothers - Happiness Begins ",
//            "Joyner Lucas - adhd",
//            "Maluma - 11-11",
//            "Never Young - LOSER",
//            "Rammstein - rammstein",
//            "Skepta - Ignorance Is Bliss",
//            "Skillet - Victory",
//            "Tylor the Creator - IGOR",
//            "YG - Stop Snitching",
//        ]
    var songs = Song.createSong()

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
        return songs.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackListCell", for: indexPath)

//        cell.textLabel?.text = trackList[indexPath.row]
//        cell.detailTextLabel?.text = trackList[indexPath.row]
//        cell.textLabel?.numberOfLines = 0
//        cell.imageView?.image = UIImage(named: trackList[indexPath.row])

        let song = songs[indexPath.row]
        cell.textLabel?.text = song.track
        cell.detailTextLabel?.text = song.album
        cell.imageView?.image = UIImage(named: song.cover)
        return cell
    }

    //MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentTrack = songs.remove(at: fromIndexPath.row)
        songs.insert(currentTrack, at: to.row)
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

  
    // Override to support conditional rearranging of the table view. Atlauj edit, lai varētu sakārtot dziesma citā secībā, ja ir "true".
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            print(indexPath.row)
            let detailVC = segue.destination as! MusicDetailViewController
            detailVC.song = songs[indexPath.row]
        }
        
    }


}

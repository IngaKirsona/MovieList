//
//  Movie.swift
//  MovieList
//
//  Created by Inga Kirsona on 03/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import Foundation

struct Movie {
    let movie: String
    let movieYear: String
    let poster: String
    
    static func createMovie() -> [Movie]{
        var movies: [Movie] = []
        let movieTracks = DataManager.shared.movie
        let movieYears = DataManager.shared.movieYear
        let posters = DataManager.shared.poster
        
        for index in 0..<movieTracks.count {
            let mov = Movie(movie: movieTracks[index], movieYear: movieYears[index], poster: posters[index])
            movies.append(mov)
        }
        return movies
    }
}

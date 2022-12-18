//
//  TVShow.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct TVShow {
    var name: String
    var popularity: CGFloat
    var releaseDate: String
    var posterPath: String
    var overview: String
}

struct TVShowList {
    var results: [TVShow]
}

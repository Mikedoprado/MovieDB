//
//  TVShow.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct TVShow: Decodable  {
    var id: Int
    var name: String
    var voteAverage: CGFloat
    var firstAirDate: String
    var posterPath: String?
    var overview: String
}

struct TVShowList: Decodable  {
    var results: [TVShow]
}

//
//  TVShow.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct TVShow: Decodable {
    var id: Int
    var name: String
    var voteAverage: CGFloat
    var firstAirDate: String
    var posterPath: String?
    var overview: String
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case voteAverage = "vote_average"
        case overview
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
    }
}

struct TVShowList: Decodable {
    var results: [TVShow]
}

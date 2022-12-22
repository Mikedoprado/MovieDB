//
//  Season.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct Season: Decodable {
    var posterPath: String?
    var seasonNumber: Int
    var airDate: String?
    var name: String
    
    private enum CodingKeys : String, CodingKey {
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case airDate = "air_date"
        case name
    }
}


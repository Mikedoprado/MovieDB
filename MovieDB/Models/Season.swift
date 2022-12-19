//
//  Season.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct Season {
    var posterPath: String
    var seasonNumber: Int
    var airDate: String
    var name: String
}

struct SeasonList {
    var seasons: [Season]
}

//
//  TVShowDetails.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct TVShowDetails {
    var id: Int
    var backdropPath: String?
    var overview: String
    var voteAverage: CGFloat
    var createdBy: CreatorList
    var name: String
    var season: SeasonList
}

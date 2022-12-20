//
//  TVShowDetails.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct TVShowDetails: Decodable {
    var id: Int
    var backdropPath: String?
    var overview: String
    var voteAverage: CGFloat
    var createdBy: [Creator]
    var name: String
    var seasons: [Season]
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case voteAverage = "vote_average"
        case overview
        case createdBy = "created_by"
        case backdropPath = "backdrop_path"
        case seasons
    }
}

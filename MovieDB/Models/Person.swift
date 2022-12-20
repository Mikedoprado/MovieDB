//
//  Person.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct Person: Decodable {
    var name: String
    var profilePath: String
    
    private enum CodingKeys : String, CodingKey {
        case name
        case profilePath = "profile_path"
    }
}

struct Cast: Decodable {
    var cast: [Person]
}

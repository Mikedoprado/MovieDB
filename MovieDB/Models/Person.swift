//
//  Person.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

struct Person: Decodable {
    var name: String
    var posterPath: String
}

struct Cast: Decodable {
    var cast: [Person]
}

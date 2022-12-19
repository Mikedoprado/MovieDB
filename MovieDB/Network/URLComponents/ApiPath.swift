//
//  ApiPath.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

enum ApiPath {
    case baseUrl, apiKey, baseURLImage
}

extension ApiPath {
    var path: String {
        switch self {
        case .apiKey: return "f6cd5c1a9e6c6b965fdcab0fa6ddd38a"
        case .baseUrl: return "https://api.themoviedb.org"
        case .baseURLImage: return "https://image.tmdb.org/t/p/w500"
        }
    }
}

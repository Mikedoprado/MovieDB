//
//  Icons.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

enum Icons {
    case star, heart
}

extension Icons {
    var systemIcon: String {
        switch self {
        case .star:
            return "star.fill"
        case .heart:
            return  "heart"
        }
    }
}

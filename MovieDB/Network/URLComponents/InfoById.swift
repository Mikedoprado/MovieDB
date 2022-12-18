//
//  InfoById.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation
enum InfoById {
    case tvShowDetails(Int)
    case tvShowCast(Int)
}

extension InfoById: Endpoint {
    var path: String {
        switch self {
        case .tvShowDetails(let tvShowId): return "/3/tv/\(tvShowId)"
        case .tvShowCast(let tvShowId): return "/3/tv/\(tvShowId)/credits"
        }
    }
}

//
//  TVShowsFeed.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

enum TVShowsFeed: CaseIterable {
    case popular, topRated, tvOnTheAir, airingToday
}

extension TVShowsFeed: Endpoint {
    var path: String {
        switch self {
        case .popular: return "/3/tv/popular"
        case .topRated: return "/3/tv/top_rated"
        case .tvOnTheAir: return "/3/tv/on_the_air"
        case .airingToday: return "/3/tv/airing_today"
        }
    }
    
    var title: String {
        switch self {
        case .popular: return "Popular"
        case .topRated: return "Top Rated"
        case .tvOnTheAir: return "On TV"
        case .airingToday: return "Airing Today"
        }
    }
}

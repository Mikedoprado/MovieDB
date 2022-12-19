//
//  TVShowFeedCellViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

protocol TVShowFeedViewModelProtocol {
    var tvShow: TVShow { get }
    var date: String { get }
    var poster: String { get }
    var overview: String { get }
    var name: String { get }
    var voteAverage: String { get }
}

final class TVShowFeedCellViewModel: TVShowFeedViewModelProtocol {
    
    var tvShow: TVShow
    
    init(tvShow: TVShow) {
        self.tvShow = tvShow
    }
    
    var date: String {
        tvShow.firstAirDate
    }
    
    var poster: String {
        ""
    }
    
    var overview: String {
        tvShow.overview
    }
    
    var name: String {
        tvShow.name
    }
    
    var voteAverage: String {
        String("\(tvShow.voteAverage)".prefix(3))
    }

}

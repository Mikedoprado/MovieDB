//
//  TVShowFeedCellViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import Foundation

protocol TVShowFeedViewModelProtocol {
    var tvShow: TVShow { get }
    var date: String { get }
    var poster: String? { get }
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
        tvShow.firstAirDate.toDate()
    }
    
    var poster: String? {
        guard let image = tvShow.posterPath else { return "notFoundImage" }
        return ApiPath.baseURLImage.path + image
    }
    
    var overview: String {
        tvShow.overview == "" ? "...Opps sorry the overview is missing" : tvShow.overview
    }
    
    var name: String {
        tvShow.name
    }
    
    var voteAverage: String {
        String("\(tvShow.voteAverage)".prefix(3))
    }
    
    var id: Int {
        tvShow.id
    }
    
    func changeFormatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }

}


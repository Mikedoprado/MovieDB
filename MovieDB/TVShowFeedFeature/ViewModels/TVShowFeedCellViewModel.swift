//
//  TVShowFeedCellViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import RxCocoa

protocol TVShowFeedViewModelProtocol {
    var tvShow: TVShow { get }
    var date: BehaviorRelay<String> { get }
    var poster: BehaviorRelay<String> { get }
    var overview: BehaviorRelay<String> { get }
    var name: BehaviorRelay<String> { get }
    var voteAverage: BehaviorRelay<String> { get }
}

final class TVShowFeedCellViewModel: TVShowFeedViewModelProtocol {
    
    var date = BehaviorRelay<String>(value: .empty)
    var poster = BehaviorRelay<String>(value: .empty)
    var overview = BehaviorRelay<String>(value: .empty)
    var name = BehaviorRelay<String>(value: .empty)
    var voteAverage = BehaviorRelay<String>(value: .empty)
    
    
    var tvShow: TVShow
    
    init(tvShow: TVShow) {
        self.tvShow = tvShow
        date.accept(tvShow.firstAirDate.toDate())
        poster.accept(posterString)
        overview.accept(description)
        name.accept(tvShow.name)
        voteAverage.accept(String("\(tvShow.voteAverage)".prefix(3)))
    }
    
    var posterString: String {
        guard let image = tvShow.posterPath else { return "notFoundImage" }
        return ApiPath.baseURLImage.path + image
    }
    
    var description: String {
        tvShow.overview == "" ? "...Opps sorry the overview is missing" : tvShow.overview
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


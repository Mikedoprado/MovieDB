//
//  FactoryTVShowFeedController.swift
//  MovieDB
//
//  Created by Michael Conchado on 20/12/22.
//

import UIKit

final class FactoryTVShowFeedController {

    private let navigationController: MovieDBNavigationController
    private let segmentedController = CategoriesSegmentedController()
    private let client: URLSessionHTTPClient
    private let service: TVShowService<TVShowList>
    
    init(navigationController: MovieDBNavigationController, client: URLSessionHTTPClient, service: TVShowService<TVShowList>) {
        self.navigationController = navigationController
        self.client = client
        self.service = service
    }
    
    private func setViewModel(service: TVShowService<TVShowList>, category: TVShowsFeed) -> TVShowCollectionViewModel {
        return TVShowCollectionViewModel(service: service, category: category)
    }
    
    private func setCollectionViewController(service: TVShowService<TVShowList>, category: TVShowsFeed) -> TVShowsCollectionViewController {
        let viewModel = setViewModel(service: service, category: category)
        return TVShowsCollectionViewController(viewModel: viewModel)
    }
    
    func makeViewController() -> UIViewController {

        let popularCollectionViewController = setCollectionViewController(service: service, category: .popular)
        let topRatedCollectionViewController = setCollectionViewController(service: service, category: .topRated)
        let onTvCollectionViewController = setCollectionViewController(service: service, category: .tvOnTheAir)
        let airingTodayCollectionViewController = setCollectionViewController(service: service, category: .airingToday)
        return TVShowFeedViewController(
            segmentedController: segmentedController,
            popularCollectionViewController: popularCollectionViewController,
            topRatedCollectionViewController: topRatedCollectionViewController,
            onTvCollectionViewController: onTvCollectionViewController,
            airingTodayCollectionViewController: airingTodayCollectionViewController)
    }
}

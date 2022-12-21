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
    
    private func setViewModel(service: TVShowListService) -> TVShowCollectionViewModel {
        return TVShowCollectionViewModel(service: service)
    }
    
    private func setCollectionViewController(category: TVShowsFeed) -> TVShowsCollectionViewController {
        let tvShowListservice = TVShowListServiceImpl(endpoint: category, service: service)
        let viewModel = setViewModel(service: tvShowListservice)
        return TVShowsCollectionViewController(viewModel: viewModel)
    }
    
    func makeViewController() -> UIViewController {

        let popularCollectionViewController = setCollectionViewController(category: .popular)
        let topRatedCollectionViewController = setCollectionViewController(category: .topRated)
        let onTvCollectionViewController = setCollectionViewController(category: .tvOnTheAir)
        let airingTodayCollectionViewController = setCollectionViewController(category: .airingToday)
        
        return TVShowFeedViewController(
            segmentedController: segmentedController,
            popularCollectionViewController: popularCollectionViewController,
            topRatedCollectionViewController: topRatedCollectionViewController,
            onTvCollectionViewController: onTvCollectionViewController,
            airingTodayCollectionViewController: airingTodayCollectionViewController)
    }
}

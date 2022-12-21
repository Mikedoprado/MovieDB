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
        let tvShowListService = TVShowListServiceImpl(endpoint: category, service: service)
        let viewModel = setViewModel(service: tvShowListService)
        return TVShowsCollectionViewController(viewModel: viewModel)
    }
    
    private func setDetailNavigation() -> DetailNavigation {
        return DetailNavigation(client: client, navigationController: navigationController)
    }
    
    func makeViewController() -> UIViewController {

        let popularCollectionViewController = setCollectionViewController(category: .popular)
        let topRatedCollectionViewController = setCollectionViewController(category: .topRated)
        let onTvCollectionViewController = setCollectionViewController(category: .tvOnTheAir)
        let airingTodayCollectionViewController = setCollectionViewController(category: .airingToday)
        let detailNavigation = setDetailNavigation()
        
        return TVShowFeedViewController(
            segmentedController: segmentedController,
            popularCollectionViewController: popularCollectionViewController,
            topRatedCollectionViewController: topRatedCollectionViewController,
            onTvCollectionViewController: onTvCollectionViewController,
            airingTodayCollectionViewController: airingTodayCollectionViewController,
            detailNavigationController: detailNavigation)
    }
}

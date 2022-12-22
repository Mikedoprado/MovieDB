//
//  FactoryTVShowDetail.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//

import UIKit

final class FactoryTVShowDetail {
    private let client: HTTPClient
    private let navigationController: UINavigationController
    private let id: Int
    lazy var serviceDetail = TVShowService<TVShowDetails>(client: client)
    lazy var serviceCast = TVShowService<Cast>(client: client)

    init(client: HTTPClient, navigationController: UINavigationController, id: Int) {
        self.client = client
        self.navigationController = navigationController
        self.id = id
    }
    
    private func setDetailViewModel(service: TVShowDetailService, id: Int) ->TVShowDetailViewModel {
        return TVShowDetailViewModel(service: service, id: id)
    }
    
    private func setCastViewModel(service: TVShowCastService, id: Int) ->TVShowCastViewModel {
        return TVShowCastViewModel(service: service, id: id)
    }
    
    func makeViewController() -> UIViewController {
        let tvShowDetailService = TVShowDetailServiceImpl(endpoint: InfoById.tvShowDetails(id), service: serviceDetail)
        let tvShowCastService = TVShowCastServiceImpl(endpoint: InfoById.tvShowCast(id), service: serviceCast)
        let tvShowDetailViewModel = setDetailViewModel(service: tvShowDetailService, id: id)
        let tvShowCastViewModel = setCastViewModel(service: tvShowCastService, id: id)
        return TVShowDetailHostingController(
            tvShowDetailViewModel: tvShowDetailViewModel,
            tvShowCastViewModel: tvShowCastViewModel)
    }
    
}

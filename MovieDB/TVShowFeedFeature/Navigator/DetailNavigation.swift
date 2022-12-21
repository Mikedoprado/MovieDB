//
//  DetailNavigation.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//

import Foundation
import UIKit

final class DetailNavigation {
    
    private let client: HTTPClient
    private let navigationController: UINavigationController
    lazy var serviceDetail = TVShowService<TVShowDetails>(client: client)
    lazy var serviceCast = TVShowService<Cast>(client: client)

    init(client: HTTPClient, navigationController: UINavigationController) {
        self.client = client
        self.navigationController = navigationController
    }
    
    private func setDetailViewModel(service: TVShowDetailService, id: Int) ->TVShowDetailViewModel {
        return TVShowDetailViewModel(service: service, id: id)
    }
    
    private func setCastViewModel(service: TVShowCastService, id: Int) ->TVShowCastViewModel {
        return TVShowCastViewModel(service: service, id: id)
    }
    
    func navigateToDetailTVShowView(id: Int) {
        let tvShowDetailService = TVShowDetailServiceImpl(endpoint: InfoById.tvShowDetails(id), service: serviceDetail)
        let tvShowCastService = TVShowCastServiceImpl(endpoint: InfoById.tvShowCast(id), service: serviceCast)
        let tvShowDetailViewModel = setDetailViewModel(service: tvShowDetailService, id: id)
        let tvShowCastViewModel = setCastViewModel(service: tvShowCastService, id: id)
        let hostingDetailController = TVShowDetailHostingController(
            tvShowDetailViewModel: tvShowDetailViewModel,
            tvShowCastViewModel: tvShowCastViewModel)
        navigationController.pushViewController(hostingDetailController, animated: true)
    }
}

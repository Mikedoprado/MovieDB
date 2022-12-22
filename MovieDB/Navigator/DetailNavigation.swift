//
//  DetailNavigation.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//

import UIKit

final class DetailNavigation {
    
    private let client: HTTPClient
    private let navigationController: UINavigationController

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
        let factoryDetailControler = FactoryTVShowDetail(client: client, navigationController: navigationController, id: id)
        let hostingDetailController = factoryDetailControler.makeViewController()
        navigationController.pushViewController(hostingDetailController, animated: true)
    }
}



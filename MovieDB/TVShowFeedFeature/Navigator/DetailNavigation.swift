//
//  DetailNavigation.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//

import Foundation
import UIKit

final class DetailNavigation {
    
    let client: HTTPClient
    let navigationController: UINavigationController
    lazy var serviceDetail = TVShowService<TVShowDetails>(client: client)
    lazy var serviceCast = TVShowService<Cast>(client: client)

    init(client: HTTPClient, navigationController: UINavigationController) {
        self.client = client
        self.navigationController = navigationController
    }
    
    func navigateToDetailTVShowView(id: Int) {
        let viewModel = TVShowDetailViewModel()
        let hostingDetailController = TVShowDetailHostingController(viewModel: viewModel)
        navigationController.pushViewController(hostingDetailController, animated: true)
    }
}

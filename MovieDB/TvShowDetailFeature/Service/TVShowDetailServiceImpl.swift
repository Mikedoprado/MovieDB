//
//  TVShowDetailServiceImpl.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//

import Combine

protocol TVShowDetailService {
    func getItems(endpoint: Endpoint) -> Future<TVShowDetails, ApiError>
}

final class TVShowDetailServiceImpl: TVShowDetailService {

    let endpoint: Endpoint
    let service: TVShowService<TVShowDetails>
    
    init(endpoint: Endpoint, service: TVShowService<TVShowDetails>) {
        self.endpoint = endpoint
        self.service = service
    }

    func getItems(endpoint: Endpoint) -> Future<TVShowDetails, ApiError> {
        return service.getItems(endpoint: endpoint)
    }

}

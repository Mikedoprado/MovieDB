//
//  TVShowCastServiceImpl.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//

import Combine

protocol TVShowCastService {
    func getItems(endpoint: Endpoint) -> Future<Cast, ApiError>
}

final class TVShowCastServiceImpl: TVShowCastService {

    let endpoint: Endpoint
    let service: TVShowService<Cast>
    
    init(endpoint: Endpoint, service: TVShowService<Cast>) {
        self.endpoint = endpoint
        self.service = service
    }

    func getItems(endpoint: Endpoint) -> Future<Cast, ApiError> {
        return service.getItems(endpoint: endpoint)
    }

}

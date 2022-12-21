//
//  TVShowListServiceImpl.swift
//  MovieDB
//
//  Created by Michael Conchado on 20/12/22.
//

import RxSwift

final class TVShowListServiceImpl: TVShowListService {

    let endpoint: Endpoint
    let service: TVShowService<TVShowList>
    
    init(endpoint: Endpoint, service: TVShowService<TVShowList>) {
        self.endpoint = endpoint
        self.service = service
    }
    
    func getItems(page: Int) -> Single<TVShowList> {
        return service.getItems(endpoint: endpoint, page: page)
    }

}

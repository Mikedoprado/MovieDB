//
//  TVShowService.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import Foundation
import RxSwift

final class TVShowService {

    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getItems<T: Decodable>(endpoint: Endpoint, page: Int?) -> Single<T> {
        let urlComponents = endpoint.getUrlComponents(queryItems: nil)
        let request = endpoint.request(urlComponents: urlComponents)
        guard let url = request.url else { return Single.error(ApiError.invalidURL) }

        return Single.create { single in
            self.client.request(from: url) { result in
                switch result {
                case let .success((data, response)):
                    guard
                        let mappedResult = ItemMapper.map(T.self, from: data, from: response) as? T
                    else { return single(.failure(ApiError.jsonConversionFailure)) }
                    single(.success(mappedResult))
                case .failure(_):
                    single(.failure(ApiError.jsonParsingFailure))
                }
            }
            return Disposables.create()
        }
    }
}

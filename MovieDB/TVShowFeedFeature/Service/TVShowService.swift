//
//  TVShowService.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import Foundation
import RxSwift
import Combine
import RxCocoa

protocol TVShowListService {
    func getItems(page: Int) -> Single<TVShowList>
}

final class TVShowService<T: Decodable> {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getItems(endpoint: Endpoint, page: Int) -> Single<T> {
        var query: [URLQueryItem] = []
        if page != 1 {
            query.append(URLQueryItem(name: "page", value: String(describing: page)))
        }
        let urlComponents = endpoint.getUrlComponents(queryItems: query, page: page)
        let request = endpoint.request(urlComponents: urlComponents)
        guard let url = request.url else { return Single.error(ApiError.invalidURL) }

        return Single.create { single in
            let task = self.client.request(from: url) { result in
                switch result {
                case let .success((data, response)):
                    do {
                        let mappedResult = try ItemMapper<T>.map(from: data, from: response)
                        single(.success(mappedResult))
                    } catch {
                        single(.failure(ApiError.jsonConversionFailure))
                    }
                case .failure(_):
                    single(.failure(ApiError.jsonParsingFailure))
                }
            }
            return Disposables.create { task.cancel() }
        }
    }

}

extension TVShowService {
    func getItems(endpoint: Endpoint) -> Future<T, ApiError> {
        return Future { [weak self] promise in
            let urlComponents = endpoint.getUrlComponents(queryItems: nil, page: 1)
            let request = endpoint.request(urlComponents: urlComponents)
            guard let url = request.url else { return promise(.failure(ApiError.invalidURL) ) }
            _ = self?.client.request(from: url) { result in
                switch result {
                case let .success((data, response)):
                    do {
                        let mappedResult = try ItemMapper<T>.map(from: data, from: response)
                        promise(.success(mappedResult))
                    } catch {
                        promise(.failure(ApiError.jsonConversionFailure))
                    }
                case .failure(_):
                    promise(.failure(ApiError.jsonParsingFailure))
                }
            }
        }
    }
}

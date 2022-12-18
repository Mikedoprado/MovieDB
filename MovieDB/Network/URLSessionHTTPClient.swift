//
//  URLSessionHTTPClient.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success((data, response)))
            } else {
                completion(.failure(ApiError.unexpectedValuesRepresentation))
            }
        }.resume()
    }

}

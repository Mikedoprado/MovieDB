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
    
    private struct URLSessionTaskWrapper: HTTPClientTask {
        let wrapped: URLSessionTask
        
        func cancel() {
            wrapped.cancel()
        }
    }

    func request(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask{
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success((data, response)))
            } else {
                completion(.failure(ApiError.unexpectedValuesRepresentation))
            }
        }
        task.resume()
        return URLSessionTaskWrapper(wrapped: task)
    }

}

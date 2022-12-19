//
//  HTTPClientSpy.swift
//  MovieDBTests
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation
@testable import MovieDB

public class HTTPClientSpy: HTTPClient {
    
    private var messages = [(url: URL, completion: (HTTPClient.Result) -> Void)]()
    
    var requestedURLs: [URL] {
        return messages.map { $0.url }
    }
    
    public func request(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) {
        messages.append((url, completion))
    }
    
    public func complete(with error: Error, at index: Int = 0) {
        messages[index].completion(.failure(error))
    }
    
    public func complete(withStatusCode code: Int, data: Data, at index: Int = 0) {
        let response = HTTPURLResponse(
            url: requestedURLs[index],
            statusCode: code,
            httpVersion: nil,
            headerFields: nil
        )!
        messages[index].completion(.success((data, response)))
    }
}

//
//  EndpointTest.swift
//  MovieDBTests
//
//  Created by Michael Conchado on 18/12/22.
//

import XCTest
@testable import MovieDB

final class EndpointTest: XCTestCase {

    func test_init_TVShowFeedEndpoint_URLCreationWithRandomValues() {
        let sut = TVShowsFeed.allCases.randomElement()
        let page = Int.random(in: 0..<10)
        let expectedURLString = "https://api.themoviedb.org\(String(describing: sut!.path))?api_key=f6cd5c1a9e6c6b965fdcab0fa6ddd38a&language=en-US&page=\(page)"
        let urlComponents = (sut?.getUrlComponents(queryItems: nil, page: page))!
        let request = sut?.request(urlComponents: urlComponents)
        
        XCTAssertEqual(request?.url?.absoluteString, expectedURLString)
    }
    
    func test_init_InfoByIdTvShowDetailsEndpoint_URLCreationWithRandomValues() {
        let sut = InfoById.tvShowDetails(1416)
        let expectedURLString = "https://api.themoviedb.org\(String(describing: sut.path))?api_key=f6cd5c1a9e6c6b965fdcab0fa6ddd38a&language=en-US"
        let urlComponents = sut.getUrlComponents(queryItems: nil)
        let request = sut.request(urlComponents: urlComponents)
        
        XCTAssertEqual(request.url?.absoluteString, expectedURLString)
    }
    
    func test_init_InfoByIdTVShowCastEndpoint_URLCreationWithRandomValues() {
        let sut = InfoById.tvShowCast(1416)
        let expectedURLString = "https://api.themoviedb.org\(String(describing: sut.path))?api_key=f6cd5c1a9e6c6b965fdcab0fa6ddd38a&language=en-US"
        let urlComponents = sut.getUrlComponents(queryItems: nil)
        let request = sut.request(urlComponents: urlComponents)
        
        XCTAssertEqual(request.url?.absoluteString, expectedURLString)
    }

}

//
//  Endpoint.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

protocol Endpoint {
    var path: String { get }
}

extension Endpoint {
    
    var base: String {
        return ApiPath.baseUrl.path
    }
    var apiKey: String {
        return ApiPath.apiKey.path
    }
    
    func getUrlComponents(queryItems: [URLQueryItem]?, page: Int) -> URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        if var query = queryItems {
            query.insert(URLQueryItem(name: "api_key", value: apiKey), at: 0)
            query.append(URLQueryItem(name: "page", value: String(page)))
            components.queryItems = query
        } else {
            components.queryItems = [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: String(page))
            ]
        }
        return components
    }
    
    func request(urlComponents: URLComponents) -> URLRequest {
        guard urlComponents.url != nil else {
            fatalError("UrlComponents fail creating the url")
        }
        return URLRequest(url: urlComponents.url!)
    }
    
}

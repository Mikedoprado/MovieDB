//
//  HTTPClient.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    func request(from url: URL, completion: @escaping (Result) -> Void)
}

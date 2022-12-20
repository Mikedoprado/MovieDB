//
//  ItemMapper.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import RxSwift

struct ItemMapper<T: Decodable> {
    static func map(from data: Data, from response: HTTPURLResponse) throws -> T {
        guard  response.isOK, let items = try? JSONDecoder().decode(T.self, from: data)
        else { throw ApiError.invalidData }
        return items
    }
}

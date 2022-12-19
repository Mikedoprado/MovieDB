//
//  ItemMapper.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import RxSwift

struct ItemMapper {
    static func map<T: Decodable>(_ type: T.Type, from data: Data, from response: HTTPURLResponse) -> Observable<T> {
       return Observable.create { observer in
            if response.isOK {
                if let items = try? JSONDecoder().decode(type.self, from: data) {
                    observer.onNext(items)
                } else {
                    observer.onError(ApiError.invalidData)
                }
            } else {
                observer.onError(ApiError.requestFailed)
            }
            observer.onCompleted()
            return Disposables.create()
        }
    }
}

//
//  HTTPURLResponse+StatusCode.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}

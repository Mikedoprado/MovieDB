//
//  Array+RemovingDuplicates.swift
//  MovieDB
//
//  Created by Michael Conchado on 20/12/22.
//

import Foundation

extension Array where Element: Equatable {
    func removeDuplicates() -> [Element] {
        return reduce(into: []) { result, element in
            if !result.contains(element) {
                result.append(element)
            }
        }
    }
}

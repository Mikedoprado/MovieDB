//
//  MarginSpaces.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

enum MarginSpaces {
    case horizontalMargin
    case verticalMargin
    case collectionViewHorizontalMargin
    case collectionViewVerticalMargin
}

extension MarginSpaces {
    var space: CGFloat {
        switch self {
        case .horizontalMargin:
            return 25
        case .verticalMargin:
            return 20
        case .collectionViewHorizontalMargin, .collectionViewVerticalMargin:
            return 9
        }
    }
}

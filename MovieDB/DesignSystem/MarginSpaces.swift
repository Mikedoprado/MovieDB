//
//  MarginSpaces.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import UIKit

enum MarginSpaces {
    case horizontalMargin
    case verticalMargin
    case collectionViewHorizontalMargin
    case collectionViewVerticalMargin
    case sizeWidthScreen
    case horizontalCellMargin
    case zero
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
        case .sizeWidthScreen:
            return UIScreen.main.bounds.width
        case .horizontalCellMargin:
            return 8
        case .zero:
            return 0
        }
    }
}

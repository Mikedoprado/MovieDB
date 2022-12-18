//
//  FontSize.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import Foundation

enum FontSize {
    case headline
    case title
    case subtitle
    case date
    case bodyCell
    case bodyDetail
    case textButton
    case caption
    case nameActor
}

extension FontSize {
    var size: CGFloat {
        switch self {
        case .headline:
            return 18
        case .title:
            return 13
        case .subtitle:
            return 14
        case .date, .bodyCell, .textButton:
            return 10
        case .bodyDetail, .caption, .nameActor:
            return 12
        }
    }
}

//
//  ProjectColors.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import UIKit
import SwiftUI

enum ProjectColors {
    case algaeGreen
    case white
    case darkTwo
    case almostBlack
    case battleshipGrey12
    case dark
    case dark85
    case slateGrey
    case greenBlue
    case pinkishGrey
    case black40
    case deepSkyBlue
    case coral
    case segmentedLinesColor
    case transparentWhite
}

extension ProjectColors {
    
    var color: UIColor {
        switch self {
        case .algaeGreen:
            return UIColor(red: 33/255, green: 205/255, blue: 101/255, alpha: 1)
        case .white:
            return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case .darkTwo:
            return UIColor(red: 37/255, green: 39/255, blue: 47/255, alpha: 1)
        case .almostBlack:
            return UIColor(red: 10/255, green: 21/255, blue: 27/255, alpha: 1)
        case .battleshipGrey12:
            return UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        case .dark:
            return UIColor(red: 26/255, green: 40/255, blue: 46/255, alpha: 1)
        case .dark85:
            return UIColor(red: 31/255, green: 41/255, blue: 45/255, alpha: 0.85)
        case .slateGrey:
            return UIColor(red: 99/255, green: 99/255, blue: 102/255, alpha: 1)
        case .greenBlue:
            return UIColor(red: 1/255, green: 210/255, blue: 119/255, alpha: 1)
        case .pinkishGrey:
            return UIColor(white: 190/255, alpha: 1)
        case .black40:
            return UIColor(white: 0.0, alpha: 0.4)
        case .deepSkyBlue:
            return UIColor(red: 10/255, green: 132/255, blue: 1/255, alpha: 1.0)
        case .coral:
            return UIColor(red: 1/255, green: 69/255, blue: 58/255, alpha: 1.0)
        case .segmentedLinesColor:
            return UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        case .transparentWhite:
          return .init(white: 0.4, alpha: 0.1)
        }
    }
}

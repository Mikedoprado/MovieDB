//
//  String+TransfomToDate.swift
//  MovieDB
//
//  Created by Michael Conchado on 20/12/22.
//

import Foundation

extension String {
    func toDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}

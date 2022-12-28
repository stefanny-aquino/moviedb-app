//
//  StringExtension.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation

extension String {
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMM dd, yyyy"
        guard let date = date else { return "" }
        return dateFormatter.string(from: date)
    }
}

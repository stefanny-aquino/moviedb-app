//
//  DoubleExtension.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation

extension Double {
    func format() -> String {
        return String(format: "%.01f", self)
    }
}

//
//  Helper.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation

struct Helper {
    
    static func getImageUrl(_ url: String?) -> String? {
        guard let url = url, let baseUrl = Network.baseImageURL else { return nil }
        return baseUrl.appendingPathComponent(url).absoluteString
    }
}

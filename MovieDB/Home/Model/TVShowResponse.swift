//
//  TVShowResponse.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 24/12/22.
//

import Foundation

struct TVShowResponse: Codable {
    let page: Int
    let results: [TVShow]
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
    }
    
}

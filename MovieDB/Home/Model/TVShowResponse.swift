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
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
    }
}

extension TVShowResponse {
    static let stubTVShowResponse = TVShowResponse(page: 1, results: [TVShow.stubTVShow()], totalPages: 1)
}

//
//  TVShowCreditsResponse.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation

struct TVShowCreditsResponse: Codable {
    let cast: [Person]
    
    enum CodingKeys: String, CodingKey {
        case cast = "cast"
    }
    
}

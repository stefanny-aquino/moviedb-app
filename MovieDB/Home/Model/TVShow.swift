//
//  TVShow.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 24/12/22.
//

import Foundation

struct TVShow: Codable, Hashable {
    let name: String
    let imagePath: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imagePath = "poster_path"
    }
    
}

//
//  Episode.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation

struct Episode: Codable, Hashable {
    let id: Int
    let name: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case posterPath = "still_path"
    }
}

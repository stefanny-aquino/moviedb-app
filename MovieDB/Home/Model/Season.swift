//
//  Season.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation

struct Season: Codable, Hashable {
    let id: Int
    let name: String
    let number: Int
    let posterPath: String?
    let airDate: String?
    var episodes: [Episode]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case number = "season_number"
        case posterPath = "poster_path"
        case airDate = "air_date"
        case episodes = "episodes"
    }
}

extension Season {
    static func stubSeason() -> Season {
        Season(id: 0, name: "", number: 0, posterPath: nil, airDate: "")
    }
}

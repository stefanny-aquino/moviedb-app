//
//  TVShow.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 24/12/22.
//

import Foundation

struct TVShow: Codable, Hashable {
    let id: Int
    let name: String
    let description: String
    let imagePath: String?
    let backdropPath: String?
    let vote: Double
    let airDate: String
    var createdBy: [Person]?
    var seasons: [Season]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "overview"
        case imagePath = "poster_path"
        case backdropPath = "backdrop_path"
        case vote = "vote_average"
        case airDate = "first_air_date"
        case createdBy = "created_by"
        case seasons = "seasons"
    }
}

extension TVShow {
    static func stubTVShow() -> TVShow {
        TVShow(id: 1, name: "", description: "", imagePath: nil, backdropPath: nil, vote: 0.0, airDate: "", createdBy: [], seasons: [])
    }
}

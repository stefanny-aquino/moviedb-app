//
//  Person.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation

struct Person: Codable, Hashable {
    let name: String
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case profilePath = "profile_path"
    }
}

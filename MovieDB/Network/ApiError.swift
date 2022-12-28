//
//  ApiError.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 28/12/22.
//

import Foundation

struct ApiError: Error, Codable {
    let statusCode: Int
    let statusMessage: String
    
    init(statusCode: Int = 500, statusMessage: String = "Error") {
        self.statusCode = statusCode
        self.statusMessage = statusMessage
    }
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

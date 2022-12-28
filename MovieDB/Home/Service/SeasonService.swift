//
//  SeasonService.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

protocol SeasonServiceProtocol {
    func getSeasonDetail(tvShowId: Int, seasonNumber: Int) -> AnyPublisher<Season, ApiError>
}

class SeasonService: SeasonServiceProtocol {
    
    let network: NetworkProtocol
    let httpClient: HTTPClientProtocol
    
    init(network: NetworkProtocol = Network(), httpClient: HTTPClientProtocol = HTTPClient()) {
        self.network = network
        self.httpClient = httpClient
    }
    
    func getSeasonDetail(tvShowId: Int, seasonNumber: Int) -> AnyPublisher<Season, ApiError> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(tvShowId)/\(SeasonEndpoint.season)/\(seasonNumber)"
        let request = network.request(path: fullPath, method: .GET, data: nil)
        return httpClient.fetch(request)
    }
}

enum SeasonEndpoint {
    static let season = "season"
}

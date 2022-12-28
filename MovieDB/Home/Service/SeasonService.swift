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
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func getSeasonDetail(tvShowId: Int, seasonNumber: Int) -> AnyPublisher<Season, ApiError> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(tvShowId)/\(SeasonEndpoint.season)/\(seasonNumber)"
        let request = network.request(path: fullPath, method: .GET, data: nil)
        return HTTPClient().fetch(request)
    }
}

enum SeasonEndpoint {
    static let season = "season"
}

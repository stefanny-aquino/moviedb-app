//
//  MovieDetailService.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

protocol MovieDetailServiceProtocol {
    func getMovieDetail(id: Int) -> AnyPublisher<TVShow, Error>
    func getMovieCredits(id: Int) -> AnyPublisher<TVShowCreditsResponse, Error>
}

class MovieDetailService: MovieDetailServiceProtocol {
    
    let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func getMovieDetail(id: Int) -> AnyPublisher<TVShow, Error> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(id)"
        let request = network.request(path: fullPath, method: .GET, data: nil)
        return HTTPClient().fetch(request)
    }
    
    func getMovieCredits(id: Int) -> AnyPublisher<TVShowCreditsResponse, Error> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(id)/\(MovieDetailEndpoint.credits)"
        let request = network.request(path: fullPath, method: .GET, data: nil)
        return HTTPClient().fetch(request)
    }
}

enum MovieDetailEndpoint {
    static let credits = "credits"
}

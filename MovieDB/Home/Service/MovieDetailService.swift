//
//  MovieDetailService.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

protocol MovieDetailServiceProtocol {
    func getMovieDetail(id: Int) -> AnyPublisher<TVShow, ApiError>
    func getMovieCredits(id: Int) -> AnyPublisher<TVShowCreditsResponse, ApiError>
}

class MovieDetailService: MovieDetailServiceProtocol {
    
    let network: NetworkProtocol
    let httpClient: HTTPClientProtocol
    
    init(network: NetworkProtocol = Network(), httpClient: HTTPClientProtocol = HTTPClient()) {
        self.network = network
        self.httpClient = httpClient
    }
    
    func getMovieDetail(id: Int) -> AnyPublisher<TVShow, ApiError> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(id)"
        let request = network.request(path: fullPath, method: .GET, parameters: nil)
        return httpClient.fetch(request)
    }
    
    func getMovieCredits(id: Int) -> AnyPublisher<TVShowCreditsResponse, ApiError> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(id)/\(MovieDetailEndpoint.credits)"
        let request = network.request(path: fullPath, method: .GET, parameters: nil)
        return httpClient.fetch(request)
    }
}

enum MovieDetailEndpoint {
    static let credits = "credits"
}

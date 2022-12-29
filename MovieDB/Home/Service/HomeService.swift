//
//  HomeService.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 24/12/22.
//

import Foundation
import Combine

protocol HomeServiceProtocol {
    func getTVShows(filterBy: FilterType, page: Int) -> AnyPublisher<TVShowResponse, ApiError>
}

class HomeService: HomeServiceProtocol {
    
    let network: NetworkProtocol
    let httpClient: HTTPClientProtocol
    
    init(network: NetworkProtocol = Network(), httpClient: HTTPClientProtocol = HTTPClient()) {
        self.network = network
        self.httpClient = httpClient
    }
    
    func getTVShows(filterBy: FilterType, page: Int) -> AnyPublisher<TVShowResponse, ApiError> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(filterBy.getPath())"
        let params: [String : Any] = [
            "page": page,
        ]
        let request = network.request(path: fullPath, method: .GET, parameters: params)
        return httpClient.fetch(request)
    }
}

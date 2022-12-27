//
//  HomeService.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 24/12/22.
//

import Foundation
import Combine

class HomeService {
    
    let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func getTVShows(filterBy: FilterType) -> AnyPublisher<TVShowResponse, Error> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(filterBy.getPath())"
        let request = network.request(path: fullPath, method: .GET, data: nil)
        return HTTPClient().fetch(request)
    }
}

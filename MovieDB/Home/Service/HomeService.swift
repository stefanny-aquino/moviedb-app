//
//  HomeService.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 24/12/22.
//

import Foundation
import Combine

class HomeService {
    
    let network: Network
    
    init(network: Network = Network()) {
        self.network = network
    }
    
    func getTVShows(filterBy: FilterType) -> AnyPublisher<TVShowResponse, Error> {
        let request = network.request(path: .tv, method: .GET, data: nil)
        return HTTPClient().fetch(request)
    }
}
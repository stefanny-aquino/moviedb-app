//
//  MovieDetailService.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

class MovieDetailService {
    
    let network: Network
    
    init(network: Network = Network()) {
        self.network = network
    }
    
    func getMovieDetail(id: Int) -> AnyPublisher<TVShow, Error> {
        let fullPath = "\(Endpoint.tvShow.rawValue)/\(id)"
        let request = network.request(path: fullPath, method: .GET, data: nil)
        return HTTPClient().fetch(request)
    }
}

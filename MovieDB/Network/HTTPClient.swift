//
//  HTTPClient.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 24/12/22.
//

import Foundation
import Combine

struct HTTPResponse<T> {
    let data: T
    let response: URLResponse
}

struct HTTPClient {
    private let session = URLSession.shared
    
    func fetch<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return session
            .dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

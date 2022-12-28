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
    
    func fetch<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, ApiError> {
        return session
            .dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw try JSONDecoder().decode(ApiError.self, from: result.data)
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error in
                error as? ApiError ?? ApiError()
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

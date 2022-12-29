//
//  HTTPClientMock.swift
//  MovieDBTests
//
//  Created by Stefanny Aquino on 28/12/22.
//

import Foundation
import Combine
@testable import MovieDB

class HTTPClientMock: HTTPClientProtocol {
    
    var withError = false
    var response: Decodable?
    
    init(withError: Bool = false, response: Decodable?) {
        self.withError = withError
        self.response = response
    }
    
    func fetch<T>(_ request: URLRequest) -> AnyPublisher<T, ApiError> where T : Decodable {
        if withError {
            return Fail(error: ApiError())
                .eraseToAnyPublisher()
        } else {
            return Just(response as! T)
                .setFailureType(to: ApiError.self)
                .eraseToAnyPublisher()
        }
    }
    
}

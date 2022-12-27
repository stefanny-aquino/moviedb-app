//
//  Network.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 24/12/22.
//

import Foundation


enum Endpoint: String {
    case tvShow = "tv"
}

enum Method: String {
    case GET
    case POST
}

protocol NetworkProtocol {
    var baseURL: URL? { get set }
    func request(path: String, method: Method, data: Data?) -> URLRequest
}

struct Network: NetworkProtocol {
    var baseURL: URL?
    private let apiKey: String
    
    init(baseURL: URL? = URL(string: "https://api.themoviedb.org/3/"), apiKey: String = "c72d42c8bdfaedc7f8495d267c31248d") {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func request(path: String, method: Method, data: Data?) -> URLRequest {
        guard let url = buildURL(with: path) else { fatalError("Error creating URLRequest") }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        request.httpBody = data
        
        return request
    }
    
    private func buildURL(with path: String) -> URL? {
        guard let baseURL = baseURL else { return nil }
        
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        else { fatalError("Error creating URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        
        return components.url
    }
    
}

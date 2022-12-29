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

typealias Parameters = [String : Any]

protocol NetworkProtocol {
    var baseURL: URL? { get set }
    func request(path: String, method: Method, parameters: Parameters?) -> URLRequest
}

struct Network: NetworkProtocol {
    var baseURL: URL?
    private let apiKey: String
    
    init(baseURL: URL? = URL(string: "https://api.themoviedb.org/3/"), apiKey: String = "c72d42c8bdfaedc7f8495d267c31248d") {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func request(path: String, method: Method, parameters: Parameters?) -> URLRequest {
        guard let url = buildURL(with: path, parameters: parameters) else { fatalError("Error creating URLRequest") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        return urlRequest
    }
    
    private func buildURL(with path: String, parameters: Parameters?) -> URL? {
        guard let baseURL = baseURL else { return nil }
        
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        else { fatalError("Error creating URLComponents") }
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let parameters = parameters {
            parameters.map { (key: String, value: Any) in
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
        }
        components.queryItems = queryItems
        return components.url
    }
    
}

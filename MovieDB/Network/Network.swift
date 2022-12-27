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


struct Network {
    private let baseURL = URL(string: "https://api.themoviedb.org/3/")
    static let baseImageURL = URL(string: "https://image.tmdb.org/t/p/w500")
    private let apiKey = "c72d42c8bdfaedc7f8495d267c31248d"
    
    enum Method: String {
        case GET
        case POST
    }
    
    func request(path: String, method: Method, data: Data?) -> URLRequest {
        guard let url = getURL(path: path) else { fatalError("Error creating URLRequest") }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        request.httpBody = data
        
        return request
    }
    
    private func getURL(path: String) -> URL? {
        guard let baseURL = baseURL else { return nil }
        
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        else { fatalError("Error creating URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        
        return components.url
    }
    
}

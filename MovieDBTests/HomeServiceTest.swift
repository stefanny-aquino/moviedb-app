//
//  HomeServiceTest.swift
//  MovieDBTests
//
//  Created by Stefanny Aquino on 28/12/22.
//

import XCTest
import Combine
@testable import MovieDB

final class HomeServiceTest: XCTestCase {
    private var disposables = Set<AnyCancellable>()
    
    func testLoadTVShows() {
        let httpClientMock = HTTPClientMock(response: TVShowResponse.stubTVShowResponse)
        let homeService = HomeService(httpClient: httpClientMock)
        var tvShowResponse: TVShowResponse?
        var apiError: ApiError?
        
        homeService.getTVShows(filterBy: .popular)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    apiError = error
                    return
                default:
                    return
                }
            } receiveValue: { response in
                tvShowResponse = response
            }
            .store(in: &disposables)
        
        XCTAssertNil(apiError)
        XCTAssertNotNil(tvShowResponse)
    }
    
    func testLoadTVShowsWithError() {
        let httpClientMock = HTTPClientMock(withError: true, response: nil)
        let homeService = HomeService(httpClient: httpClientMock)
        var apiError: ApiError?
        var tvShowResponse: TVShowResponse?
        
        homeService.getTVShows(filterBy: .popular)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    apiError = error
                    return
                default:
                    return
                }
            } receiveValue: { response in
                tvShowResponse = response
            }
            .store(in: &disposables)
        
        XCTAssertNotNil(apiError)
        XCTAssertNil(tvShowResponse)
        
    }
    
}

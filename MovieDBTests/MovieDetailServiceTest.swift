//
//  MovieDetailServiceTest.swift
//  MovieDBTests
//
//  Created by Stefanny Aquino on 28/12/22.
//

import XCTest
import Combine
@testable import MovieDB

final class MovieDetailServiceTest: XCTestCase {
    private var disposables = Set<AnyCancellable>()
    
    func testLoadMovieDetail() {
        let httpClientMock = HTTPClientMock(response: TVShow.stubTVShow())
        let movieService = MovieDetailService(httpClient: httpClientMock)
        var tvShow: TVShow?
        var apiError: ApiError?
        
        movieService.getMovieDetail(id: 1)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    apiError = error
                    return
                default:
                    return
                }
            } receiveValue: { response in
                tvShow = response
            }
            .store(in: &disposables)
        
        XCTAssertNil(apiError)
        XCTAssertNotNil(tvShow)
    }
    
    func testLoadMovieDetailWithError() {
        let httpClientMock = HTTPClientMock(withError: true, response: nil)
        let movieService = MovieDetailService(httpClient: httpClientMock)
        var tvShow: TVShow?
        var apiError: ApiError?
        
        movieService.getMovieDetail(id: 1)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    apiError = error
                    return
                default:
                    return
                }
            } receiveValue: { response in
                tvShow = response
            }
            .store(in: &disposables)
        
        XCTAssertNotNil(apiError)
        XCTAssertNil(tvShow)
        
    }
}

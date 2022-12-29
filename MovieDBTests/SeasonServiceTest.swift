//
//  SeasonServiceTest.swift
//  MovieDBTests
//
//  Created by Stefanny Aquino on 28/12/22.
//

import XCTest
import Combine
@testable import MovieDB

final class SeasonServiceTest: XCTestCase {

    private var disposables = Set<AnyCancellable>()

    func testLoadSeasonDetail() {
        let httpClientMock = HTTPClientMock(response: Season.stubSeason())
        let seasonService = SeasonService(httpClient: httpClientMock)
        var season: Season?
        var apiError: ApiError?
        
        seasonService.getSeasonDetail(tvShowId: 1, seasonNumber: 1)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    apiError = error
                    return
                default:
                    return
                }
            } receiveValue: { response in
                season = response
            }
            .store(in: &disposables)
        
        XCTAssertNil(apiError)
        XCTAssertNotNil(season)
    }
    
    func testLoadSeasonDetailWithError() {
        let httpClientMock = HTTPClientMock(withError: true, response: nil)
        let seasonService = SeasonService(httpClient: httpClientMock)
        var season: Season?
        var apiError: ApiError?
        
        seasonService.getSeasonDetail(tvShowId: 1, seasonNumber: 1)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    apiError = error
                    return
                default:
                    return
                }
            } receiveValue: { response in
                season = response
            }
            .store(in: &disposables)
        
        XCTAssertNotNil(apiError)
        XCTAssertNil(season)
        
    }
}

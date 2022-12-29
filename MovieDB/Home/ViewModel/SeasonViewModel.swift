//
//  SeasonViewModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

class SeasonViewModel: ObservableObject {
    // MARK: - Variables
    @Published var season: Season = .stubSeason()
    @Published var errorAlert = false
    var errorMessage: String = ""
    var seasonService: SeasonService
    var tvShowId: Int
    var seasonNumber: Int
    private var disposables = Set<AnyCancellable>()
    
    // MARK: - Initializer
    init(seasonService: SeasonService = SeasonService(), tvShowId: Int, seasonNumber: Int) {
        self.seasonService = seasonService
        self.tvShowId = tvShowId
        self.seasonNumber = seasonNumber
    }
    
    // MARK: - Functions
    func getSeasonDetail() {
        seasonService.getSeasonDetail(tvShowId: tvShowId, seasonNumber: seasonNumber)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.statusMessage
                    self?.errorAlert = true
                case .finished:
                    break
                }
            } receiveValue: { response in
                self.season = response
            }
            .store(in: &disposables)
    }
    
}

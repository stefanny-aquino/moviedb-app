//
//  SeasonViewModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

class SeasonViewModel: ObservableObject {
    private var disposables = Set<AnyCancellable>()
    @Published var season: Season = .stubSeason()
    var seasonService: SeasonService
    var tvShowId: Int
    var seasonNumber: Int
    
    init(seasonService: SeasonService = SeasonService(), tvShowId: Int, seasonNumber: Int) {
        self.seasonService = seasonService
        self.tvShowId = tvShowId
        self.seasonNumber = seasonNumber
    }
    
    func getSeasonDetail() {
        seasonService.getSeasonDetail(tvShowId: tvShowId, seasonNumber: seasonNumber)
            .sink { completion in
            } receiveValue: { response in
                self.season = response
            }
            .store(in: &disposables)
    }
    
}

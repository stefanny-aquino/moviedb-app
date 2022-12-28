//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    private var disposables = Set<AnyCancellable>()
    var movieDetailService: MovieDetailService
    
    @Published var tvShow: TVShow = .stubTVShow()
    var lastSeason: Season = .stubSeason()
    @Published var cast: [Person] = []
    
    init(movieDetailService: MovieDetailService = MovieDetailService()) {
        self.movieDetailService = movieDetailService
    }
    
    func getMovie(_ id: Int) {
        movieDetailService.getMovieDetail(id: id)
            .sink { completion in
            } receiveValue: { response in
                self.tvShow = response
                self.getLastSeason(response.seasons)
            }
            .store(in: &disposables)
    }
    
    func getMovieCredits(_ id: Int) {
        movieDetailService.getMovieCredits(id: id)
            .sink { completion in
            } receiveValue: { response in
                self.cast = response.cast
            }
            .store(in: &disposables)
    }
    
    private func getLastSeason(_ seasons: [Season]?) {
        guard let seasons = seasons, let season = seasons.sorted(by: { $0.number > $1.number }).first else { return }
        lastSeason = season
    }
}

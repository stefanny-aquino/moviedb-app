//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    // MARK: - Variables
    @Published var tvShow: TVShow = .stubTVShow()
    @Published var cast: [Person] = []
    @Published var errorAlert = false
    var errorMessage: String = ""
    var lastSeason: Season = .stubSeason()
    var movieDetailService: MovieDetailService
    private var disposables = Set<AnyCancellable>()

    // MARK: - Initializer
    init(movieDetailService: MovieDetailService = MovieDetailService()) {
        self.movieDetailService = movieDetailService
    }
    
    // MARK: - Functions
    func getMovie(_ id: Int) {
        movieDetailService.getMovieDetail(id: id)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.statusMessage
                    self?.errorAlert = true
                case .finished:
                    break
                }
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

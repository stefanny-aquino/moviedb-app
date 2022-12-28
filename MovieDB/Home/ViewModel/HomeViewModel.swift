//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var disposables = Set<AnyCancellable>()
    var homeService: HomeService
    
    @Published var tvShows: [TVShow] = []
    @Published var selection: FilterType = .popular
    @Published var selectedMovie = 0
    @Published var showDetailMovie = false
    
    init(homeService: HomeService = HomeService()) {
        self.homeService = homeService
    }
    
    func getTVShows(_ filterType: FilterType) {
        homeService.getTVShows(filterBy: filterType)
            .sink { completion in
            } receiveValue: { response in
                self.tvShows = response.results
            }
            .store(in: &disposables)
    }
    
}

enum FilterType: String, CaseIterable {
    case popular = "Popular"
    case topRated = "Top Rated"
    case onTV = "On TV"
    case airingToday = "Airing Today"
    
    func getPath() -> String {
        switch self {
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .onTV:
            return "on_the_air"
        case .airingToday:
            return "airing_today"
        }
    }
}

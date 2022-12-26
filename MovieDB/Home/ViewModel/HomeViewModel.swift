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
    
    init(homeService: HomeService = HomeService()) {
        self.homeService = homeService
    }
    
    func getTVShows() {
        homeService.getTVShows(filterBy: .popular)
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
}

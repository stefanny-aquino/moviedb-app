//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    // MARK: - Variables
    @Published var tvShows: [TVShow] = []
    @Published var selection: FilterType = .popular
    @Published var selectedMovie = 0
    @Published var showDetailMovie = false
    @Published var errorAlert = false
    var errorMessage: String = ""
    var totalPages = 0
    var page : Int = 1
    var homeService: HomeService
    private var disposables = Set<AnyCancellable>()

    // MARK: - Initializer
    init(homeService: HomeService = HomeService()) {
        self.homeService = homeService
    }
    
    // MARK: - Functions
    func loadMoreTVShows(item: TVShow) {
        let index = self.tvShows.index(self.tvShows.endIndex, offsetBy: -1)
        if tvShows[index].id == item.id,
           (page + 1) <= totalPages {
            page += 1
            getTVShows(selection, page: page)
        }
    }
    
    func resetPagination() {
        page = 1
        tvShows.removeAll()
    }
    
    func getTVShows(_ filterType: FilterType, page: Int) {
        homeService.getTVShows(filterBy: filterType, page: page)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.statusMessage
                    self?.errorAlert = true
                case .finished:
                    break
                }
            } receiveValue: { response in
                self.tvShows.append(contentsOf: response.results)
                self.totalPages = response.totalPages
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

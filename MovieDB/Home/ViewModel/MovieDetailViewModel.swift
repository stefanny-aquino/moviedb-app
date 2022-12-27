//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    
    @Published var tvShow: TVShow = TVShow(id: 1, name: "", description: "", imagePath: nil, backdropPath: nil, vote: 0.0, airDate: "", createdBy: [], seasons: [])
    
    func getMovie(_ id: Int) {
        
    }
}

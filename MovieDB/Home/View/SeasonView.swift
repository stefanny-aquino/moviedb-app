//
//  SeasonView.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import SwiftUI

struct SeasonView: View {
    @ObservedObject var seasonViewModel: SeasonViewModel
    
    init(tvShowId: Int, seasonNumber: Int) {
        self.seasonViewModel = SeasonViewModel(tvShowId: tvShowId, seasonNumber: seasonNumber)
    }
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.bottom)
            VStack(alignment: .leading) {
                Text(seasonViewModel.season.name)
                    .bold()
                    .foregroundColor(Color.primary)
                ScrollView(showsIndicators: false) {
                    ForEach(seasonViewModel.season.episodes ?? [], id: \.self) { item in
                        EpisodeView(episode: item)
                    }
                }
            }
            .padding(35)
        }
        .alert(isPresented: $seasonViewModel.errorAlert) {
            Alert(title: Text("Error"), message: Text(seasonViewModel.errorMessage))
        }
        .onAppear {
            seasonViewModel.getSeasonDetail()
        }
    }
}

struct EpisodeView: View {
    let episode: Episode
    
    var body: some View {
        ZStack() {
            ImageView(url: Helper.getImageUrl(episode.posterPath))
                .scaledToFill()
            VStack {
                Text(episode.name)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
            }
            .padding(.top, 90)
        }
        .frame(height: 130)
        .cornerRadius(15)
        .padding(.bottom, 10)
    }
}

struct SeasonView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonView(tvShowId: 0, seasonNumber: 0)
    }
}

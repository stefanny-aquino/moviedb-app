//
//  MovieDetailView.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    var tvShowId: Int
    
    init(movieDetailViewModel: MovieDetailViewModel = MovieDetailViewModel(), tvShowId: Int) {
        self.viewModel = movieDetailViewModel
        self.tvShowId = tvShowId
    }
    
    var body: some View {
        ZStack {
            Color("background.black")
            VStack{
                ImageView(url: Helper.getImageUrl(viewModel.tvShow.backdropPath))
                    .frame(height: 210)
                Spacer()
            }
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("detail.black"))
                        .cornerRadius(25)
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color.green)
                                Text(viewModel.tvShow.vote.format())
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .offset(y: -20)
                            .padding(.trailing, 33)
                        }
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 15) {
                                TitleView(text: "Summary")
                                HStack {
                                    Text(viewModel.tvShow.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(.trailing, 20)
                                        .foregroundColor(Color("primary.green"))
                                }
                                Text(viewModel.tvShow.description)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                Text(getCrew(viewModel.tvShow.createdBy))
                                    .bold()
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                TitleView(text: "Last Season")
                                HStack {
                                    ImageView(url: Helper.getImageUrl(viewModel.lastSeason.posterPath))
                                        .frame(width: 130, height: 180)
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(viewModel.lastSeason.name)
                                            .bold()
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        Text(viewModel.lastSeason.airDate.formatDate())
                                            .font(.caption2)
                                            .foregroundColor(Color("primary.green"))
                                        Button {
                                            
                                        } label: {
                                            Text("View All Seasons")
                                                .font(.caption2)
                                                .foregroundColor(.white)
                                                .padding(.vertical, 10)
                                                .padding(.horizontal, 12)
                                        }
                                        .background(Color("primary.green"))
                                        .cornerRadius(5)
                                        
                                    }
                                    .padding(.leading, 30)
                                }
                                TitleView(text: "Cast")
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        }
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.top, 180)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            viewModel.getMovie(tvShowId)
        }
    }
    
    func getCrew(_ createdBy: [Person]?) -> String {
        guard let createdBy = createdBy else { return "" }
        return createdBy.map { $0.name }.joined(separator: ", ")
    }
    
}

struct TitleView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.headline)
            .foregroundColor(Color("primary.green"))
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(tvShowId: 0)
    }
}



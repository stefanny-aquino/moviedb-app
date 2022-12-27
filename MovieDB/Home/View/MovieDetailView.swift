//
//  MovieDetailView.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
    var tvShow: TVShow
    
    var body: some View {
        ZStack {
            Color("background.black")
            VStack{
                ImageView(url: tvShow.backdropPath)
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
                                Text(tvShow.vote.format())
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
                                    Text(tvShow.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(.trailing, 20)
                                        .foregroundColor(Color("primary.green"))
                                }
                                Text(tvShow.description)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                Text(getCrew(tvShow.createdBy))
                                    .bold()
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                TitleView(text: "Last Season")
                                HStack {
                                    Image("img.preview")
                                        .resizable()
                                        .frame(width: 130, height: 180)
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Season 4")
                                            .bold()
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        Text("Nov 10, 14")
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
        
    }
    
    func getCrew(_ createdBy: [Person]) -> String {
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
        MovieDetailView(tvShow:  TVShow(id: 1, name: "Test", description: "Test", imagePath: nil, backdropPath: nil, vote: 9.8, airDate: "2022-09-09", createdBy: [Person(name: "Jhon Doe", profilePath: nil), Person(name: "Jhon Doe", profilePath: nil)], seasons: []))
    }
}



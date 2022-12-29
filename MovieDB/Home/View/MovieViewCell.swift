//
//  MovieViewCell.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import SwiftUI

struct MovieViewCell: View {
    // MARK: - Variables
    var tvShow: TVShow
    let selectedMovie : () -> Void
    var description: String {
        tvShow.description.isEmpty ? "No description found" : tvShow.description
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            ImageView(url: Helper.getImageUrl(tvShow.imagePath))
                .scaledToFill()
                .frame(height: 220)
            infoView
        }
        .cornerRadius(15)
        .onTapGesture {
            selectedMovie()
        }
    }

    var infoView: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(tvShow.name)
                    .bold()
                    .font(.footnote)
                    .lineLimit(1)
                HStack {
                    Text(tvShow.airDate.formatDate())
                        .bold()
                        .font(.caption2)
                    Spacer()
                    HStack(spacing: 3) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                        Text("\(tvShow.vote.format())")
                            .bold()
                            .font(.caption2)
                    }
                }
                Text(description)
                    .foregroundColor(.white)
                    .font(.caption2)
                    .lineLimit(4)
                    .frame(height: 56)
            }
            .padding(10)
            .padding(.bottom, 5)
            .foregroundColor(Color.primary)
        }
        .frame(height: 130)
        .background(Color.black)
    }
}

struct MovieViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieViewCell(tvShow: TVShow(id: 1, name: "Test", description: "Test", imagePath: nil, backdropPath: nil, vote: 7.8, airDate: "2022-08-23", createdBy: [], seasons: [])) { }
            .frame(width: 175)
    }
}

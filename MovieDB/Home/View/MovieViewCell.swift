//
//  MovieViewCell.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import SwiftUI

struct MovieViewCell: View {
    
    var tvShow: TVShow
    
    var body: some View {
        VStack {
            ImageView(url: getImageUrl(path: tvShow.imagePath))
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
                Text(tvShow.description)
                    .foregroundColor(.white)
                    .font(.caption2)
                    .lineLimit(4)
            }
            .padding(10)
            .padding(.bottom, 12)
            .foregroundColor(Color("primary.green"))
        }
        .frame(height: 350)
        .background(Color("black"))
        .cornerRadius(15)
    }
    
    private func getImageUrl(path: String?) -> String? {
        guard let url = path, let baseUrl = Network.baseImageURL else { return nil }
        return baseUrl.appendingPathComponent(url).absoluteString
    }
}

struct MovieViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieViewCell(tvShow: TVShow(id: 1, name: "Test", description: "Test", imagePath: nil, vote: 7.8, airDate: "2022-08-23"))
            .frame(width: 175)
    }
}

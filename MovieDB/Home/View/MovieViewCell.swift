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
                HStack {
                    Text("Aug 10, 2020")
                        .bold()
                        .font(.caption2)
                    Spacer()
                    Text("7.6")
                        .bold()
                        .font(.caption2)
                }
                Text("Description")
                    .font(.caption2)
                    .lineLimit(4)
            }
            .padding(10)
            .padding(.bottom, 12)
            .foregroundColor(.white)
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
        MovieViewCell(tvShow: TVShow(name: "Test", imagePath: nil))
            .frame(width: 175)
    }
}

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
            if #available(iOS 15.0, *) {
                if let imageUrl = getImageUrl(path: tvShow.imagePath) {
                    AsyncImage(url: imageUrl)
                        .scaledToFit()
                } else {
                    Image("img.logo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: .infinity)
                }
            } else {
                
            }
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
    
    private func getImageUrl(path: String?) -> URL? {
        guard let url = path else { return nil }
        return Network.baseImageURL?.appendingPathComponent(url)
    }
}

struct MovieViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieViewCell(tvShow: TVShow(name: "Test", imagePath: nil))
            .frame(width: 175)
    }
}

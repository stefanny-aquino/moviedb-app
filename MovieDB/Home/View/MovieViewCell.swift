//
//  MovieViewCell.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import SwiftUI

struct MovieViewCell: View {
    var body: some View {
        VStack {
            Image("img.logo")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
            VStack(alignment: .leading, spacing: 10) {
                Text("Title")
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
}

struct MovieViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieViewCell()
            .frame(width: 175)
    }
}

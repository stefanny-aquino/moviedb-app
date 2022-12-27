//
//  CastViewCell.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 27/12/22.
//

import Foundation
import SwiftUI

struct CastViewCell: View {
    
    var cast: Person
    
    var body: some View {
        VStack(spacing: 0) {
            ImageView(url: Helper.getImageUrl(cast.profilePath))
                .clipShape(Circle())
                .scaledToFit()
                .frame(height: 130)
            Text(cast.name)
                .foregroundColor(.white)
                .font(.caption2)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .offset(y: -10)
                .frame(height: 40)
        }
    }
}

struct CastViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CastViewCell(cast: Person(name: "Test", profilePath: nil))
            .frame(width: 100, height: 170)
    }
}

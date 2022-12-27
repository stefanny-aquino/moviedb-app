//
//  ImageView.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageModel: ImageModel
    var defaultImage: UIImage {
        UIImage(named: "img.preview") ?? UIImage()
    }
    
    init(url: String?) {
        imageModel = ImageModel(imageUrl: url)
    }
    
    var body: some View {
        Image(uiImage: imageModel.image ?? defaultImage)
            .resizable()
    }
}

//
//  CustomTextFieldStyle.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(
                Color(.white)
            )
            .cornerRadius(5)
    }
}

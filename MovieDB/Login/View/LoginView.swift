//
//  LoginView.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 85) {
                HStack {
                    Spacer()
                    Image("img.logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 128)
                    Spacer()
                }
                VStack(spacing: 20) {
                    TextField("Username", text: $viewModel.username)
                        .textFieldStyle(CustomTextFieldStyle())
                    TextField("Password", text: $viewModel.password).textFieldStyle(CustomTextFieldStyle())
                    Button {
                        
                    } label: {
                        Text("Log in")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        Color.primary
                    )
                    .cornerRadius(5)
                }.padding(.horizontal, 60)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

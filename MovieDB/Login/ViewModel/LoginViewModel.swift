//
//  LoginViewModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
}

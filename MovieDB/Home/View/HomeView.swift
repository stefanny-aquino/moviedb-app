//
//  HomeView.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 23/12/22.
//

import Foundation
import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    @State var selection: FilterType = .popular
    
    init(homeViewModel: HomeViewModel = HomeViewModel()) {
        self.homeViewModel = homeViewModel
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        ZStack {
            Color("header")
                .edgesIgnoringSafeArea(.top)
            Color("background.black")
                .edgesIgnoringSafeArea(.bottom)
            VStack {
                VStack {
                    HStack {
                        Text("TV Shows")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                }
                .background(Color("header"))
                
                Picker("Title", selection: $selection) {
                    ForEach(FilterType.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
                ScrollView {
                    LazyVGrid(columns: [.init(), .init()], spacing: 10) {
                        
                        ForEach(homeViewModel.tvShows, id: \.self) { item in
                            MovieViewCell(tvShow: item)
                        }
                    }.padding(10)
                }
            }
        }
        .onAppear {
            homeViewModel.getTVShows()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

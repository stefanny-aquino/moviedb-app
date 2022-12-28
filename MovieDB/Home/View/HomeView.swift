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
    
    init(homeViewModel: HomeViewModel = HomeViewModel()) {
        self.homeViewModel = homeViewModel
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: MovieDetailView(tvShowId: homeViewModel.selectedMovie), isActive: $homeViewModel.showDetailMovie, label: {
                EmptyView()
            })
            
            ZStack {
                Color("header")
                    .edgesIgnoringSafeArea(.top)
                Color("background.black")
                    .edgesIgnoringSafeArea(.bottom)
                VStack {
                    HeaderView()
                    Picker("Title", selection: $homeViewModel.selection) {
                        ForEach(FilterType.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                    .onChange(of: homeViewModel.selection, perform: { newValue in
                        homeViewModel.getTVShows(newValue)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.vertical, 15)
                    .padding(.horizontal, 25)
                    ScrollView {
                        LazyVGrid(columns: [.init(), .init()], spacing: 10) {
                            ForEach(homeViewModel.tvShows, id: \.self) { item in
                                MovieViewCell(tvShow: item) {
                                    homeViewModel.selectedMovie = item.id
                                    homeViewModel.showDetailMovie.toggle()
                                }
                            }
                        }.padding(10)
                    }
                }
            }
            .onAppear {
                homeViewModel.getTVShows(homeViewModel.selection)
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("TV Shows")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 45)
        }
        .background(Color("header"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

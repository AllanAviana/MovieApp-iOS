//
//  DetailView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI
import SwiftfulLoadingIndicators


struct DetailView: View {
    let movie: Movie
    @EnvironmentObject var viewModel: MoviesViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        if viewModel.isLoadingDetails {
            VStack {
                LoadingIndicator(color: .white, size: .large, speed: .normal)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.black)
            .onAppear{
                viewModel.loading()
            }
        }else {
            VStack {
                DetailHeaderView(movie: movie, dismiss: dismiss)
                    .frame(width: 430, height: 305)
                
                MovieDetailInfoView(movie: movie)
                    .padding(.horizontal, 25)
                
                Spacer()
                
                FavoriteButton(movie: movie)
                    .padding(20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .toolbar(.hidden, for: .tabBar)
            .navigationBarBackButtonHidden(true)
        }
    }
}

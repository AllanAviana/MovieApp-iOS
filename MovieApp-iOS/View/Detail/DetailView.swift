//
//  DetailView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    @EnvironmentObject var viewModel: MoviesViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
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

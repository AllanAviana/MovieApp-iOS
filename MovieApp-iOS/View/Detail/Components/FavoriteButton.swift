//
//  FavoriteButton.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct FavoriteButton: View {
    let movie: Movie
    @EnvironmentObject var viewModel: MoviesViewModel

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                viewModel.favorite(movie: movie)
            }) {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(
                            viewModel.genres.favorite.contains(where: { $0.id == movie.id }) ? Color.red : Color.gray
                        )
                }
            }
        }
    }
}

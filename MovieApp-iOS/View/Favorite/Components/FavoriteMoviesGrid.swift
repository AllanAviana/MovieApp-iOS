//
//  FavoriteMoviesGrid.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct FavoriteMoviesGrid: View {
    let movies: [Movie]
    @Binding var isVisible: Bool

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(movies, id: \.id) { movie in
                    FavoriteMovieCellView(movie: movie, isVisible: $isVisible)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

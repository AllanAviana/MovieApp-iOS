//
//  GenresListView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct GenresListView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            GenreRowView(title: "Romance", movies: viewModel.genres.romance)
            GenreRowView(title: "Horror", movies: viewModel.genres.horror)
            GenreRowView(title: "Action", movies: viewModel.genres.action)
            GenreRowView(title: "Suspense", movies: viewModel.genres.suspense)
        }
        .padding(.vertical)
    }
}

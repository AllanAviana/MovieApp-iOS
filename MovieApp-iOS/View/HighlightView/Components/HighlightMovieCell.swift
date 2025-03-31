//
//  HighlightMovieCell.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct HighlightMovieCell: View {
    let movie: Movie
    
    var body: some View {
        ZStack {
            if let url = movie.posterURL {
                NavigationLink(destination: DetailView(movie: movie)) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 349, height: 573)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                                .frame(width: 349, height: 573)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .shadow(radius: 5)
                }
            }
        }
    }
}

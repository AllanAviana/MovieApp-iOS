//
//  PosterImageView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct PosterImageView: View {
    let movie: Movie

    var body: some View {
        if let url = movie.posterURL {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 430, height: 305)
                case .failure:
                    Image("Placeholder")
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

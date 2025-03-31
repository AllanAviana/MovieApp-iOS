//
//  FavoriteMovieCellView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct FavoriteMovieCellView: View {
    let movie: Movie
    @Binding var isVisible: Bool

    var body: some View {
        VStack {
            if let url = movie.posterURL,
               let uniqueUrl = url.appendingQueryParameter(name: "v", value: "\(Date().timeIntervalSince1970)") {
                NavigationLink(destination: DetailView(movie: movie)) {
                    AsyncImage(url: uniqueUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 140, height: 200)
                    .cornerRadius(8)
                    .clipped()
                }
            }
            
            Text(movie.title)
                .font(.caption)
                .foregroundColor(.white)
                .frame(width: 120)
                .lineLimit(2)
        }
        .opacity(isVisible ? 1 : 0)
        .scaleEffect(isVisible ? 1 : 0.5)
        .onAppear {
            isVisible = true
        }
        .animation(.easeInOut(duration: 2), value: isVisible)
    }
}

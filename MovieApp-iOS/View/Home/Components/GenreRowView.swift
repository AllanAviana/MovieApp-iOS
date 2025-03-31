//
//  GenreRowView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct GenreRowView: View {
    let title: String
    let movies: [Movie]
    @State private var isVisible: Bool = false
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
                .padding(.leading, 16)
            
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(spacing: 16) {
                    ForEach(movies) { movie in
                        NavigationLink(destination: DetailView(movie: movie)) {
                            VStack {
                                if let url = movie.posterURL {
                                    AsyncImage(url: url) { image in
                                        image.resizable().scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 120, height: 180)
                                    .cornerRadius(8)
                                    .clipped()
                                }
                                
                                Text(movie.title)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .frame(width: 120)
                                    .lineLimit(2)
                            }
                            .opacity(isVisible ? 1 : 0)
                            .scaleEffect(isVisible ? 1 : 0.5)
                            .onAppear { isVisible = true }
                            .animation(.easeInOut(duration: 2), value: isVisible)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

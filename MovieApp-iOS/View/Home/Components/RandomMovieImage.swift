//
//  RandomMovieImage.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct RandomMovieImage: View {
    @ObservedObject var ViewModel: MoviesViewModel
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .center) {
            if let url = movie.posterURL {
                NavigationLink(destination: DetailView(movie: movie)) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 397, height: 220)
                                .scaledToFit()
                        case .failure:
                            Image("Placeholder")
                        case .empty:
                            EmptyView()
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 397, height: 220)
                    .cornerRadius(8)
                }
            }
            
            Text(movie.title)
                .font(.custom("", size: 14))
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

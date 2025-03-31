//
//  HighlightTabView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct HighlightTabView: View {
    let movies: [Movie]
    
    var body: some View {
        TabView {
            ForEach(movies, id: \.id) { movie in
                HighlightMovieCell(movie: movie)
                    .padding(.horizontal, 20)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(width: 349, height: 573)
        .cornerRadius(60)
        .padding(.top, 32)
    }
}

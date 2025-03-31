//
//  DetailHeaderView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct DetailHeaderView: View {
    let movie: Movie
    let dismiss: DismissAction

    var body: some View {
        ZStack(alignment: .top) {
            PosterImageView(movie: movie)
            
            VStack {
                Spacer()
                MovieName(name: movie.title)
                    .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button(action: {
                dismiss()
            }) {
                Return()
            }
            
            GradientOverlay()
        }
    }
}

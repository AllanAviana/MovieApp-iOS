//
//  MovieDetailInfoView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct MovieDetailInfoView: View {
    let movie: Movie
    @EnvironmentObject var viewModel: MoviesViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(movie.vote_average.description + "/10")
                    .font(.custom("", size: 14))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(movie.vote_count) votes")
                    .font(.custom("", size: 14))
                    .foregroundStyle(.white)
            }
            
            HStack {
                let starCount = Int(round(movie.vote_average / 2))
                ForEach(0..<starCount, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Spacer()
                Text("\(movie.formattedReleaseDate)")
                    .font(.custom("", size: 14))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            
            Text("\(viewModel.geners(ids: movie.genre_ids))")
                .font(.custom("", size: 14))
                .foregroundStyle(.white)
                .opacity(0.5)
                .padding(.top, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if !movie.overview.isEmpty {
                Text(movie.overview)
                    .font(.custom("", size: 22))
                    .foregroundStyle(.white)
                    .padding(.top, 30)
                    .frame(maxWidth: .infinity,maxHeight: .infinity ,alignment: .topLeading)
            } else {
                Text("Descrição não disponível")
                    .font(.custom("", size: 16))
                    .foregroundStyle(.white)
                    .padding(.top, 30)
                    .opacity(0.5)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//
//  HeaderView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        RandomMovieImage(
            ViewModel: viewModel,
            movie: viewModel.randomMovie() ?? Movie(
                id: 0,
                adult: false,
                backdrop_path: nil,
                genre_ids: [],
                original_language: "",
                original_title: "",
                overview: "",
                popularity: 0,
                poster_path: nil,
                release_date: nil,
                title: "",
                video: false,
                vote_average: 0,
                vote_count: 0
            )
        )
    }
}

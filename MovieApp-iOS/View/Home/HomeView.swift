//
//  HomeView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI
import SwiftfulLoadingIndicators

struct HomeView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        if viewModel.isLoading {
            LoadingView()
        } else {
            MainContentView()
        }
    }
}



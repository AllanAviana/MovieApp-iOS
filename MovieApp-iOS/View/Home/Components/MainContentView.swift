//
//  MainContentView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct MainContentView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollContentView()
            Logo()
        }
        .environmentObject(viewModel)
    }
}

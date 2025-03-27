//
//  MovieApp_iOSApp.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 25/03/25.
//

import SwiftUI

@main
struct MovieApp_iOSApp: App {
    @StateObject var viewModel = MoviesViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(viewModel) // Compartilha com todas as views filhas

        }
    }
}

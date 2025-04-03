//
//  FavoriteView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    @State private var refreshId = UUID()
    @State private var isVisible: Bool = false
    
    var body: some View {
        
        VStack {
            FavoriteHeaderView()
            FavoriteMoviesGrid(movies: viewModel.genres.favorite, isVisible: $isVisible)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .id(refreshId)
        .onAppear {
            refreshId = UUID()
        }
    }
}

extension URL {
    func appendingQueryParameter(name: String, value: String) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        var queryItems = components.queryItems ?? []
        queryItems.append(URLQueryItem(name: name, value: value))
        components.queryItems = queryItems
        return components.url
    }
}

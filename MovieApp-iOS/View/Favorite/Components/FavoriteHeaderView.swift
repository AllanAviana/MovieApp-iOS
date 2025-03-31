//
//  FavoriteHeaderView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct FavoriteHeaderView: View {
    var body: some View {
        Text("Favorite\nMovies")
            .font(.custom("RedHatDisplay-Bold", size: 40))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    FavoriteHeaderView()
}

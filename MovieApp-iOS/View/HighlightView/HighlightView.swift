//
//  HighlightView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 27/03/25.
//

import SwiftUI

struct HighlightView: View {
    let movies: [Movie]
    
    var body: some View {
        NavigationStack {
            VStack {
                HighlightHeaderView()
                HighlightTabView(movies: movies)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
    }
}

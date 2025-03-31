//
//  ScrollContentView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct ScrollContentView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 60)
                HeaderView()
                GenresListView()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

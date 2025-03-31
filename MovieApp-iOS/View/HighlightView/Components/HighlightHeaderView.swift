//
//  HighlightHeaderView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct HighlightHeaderView: View {
    var body: some View {
        Text("Highlights")
            .font(.custom("", size: 64))
            .fontWeight(.bold)
            .foregroundStyle(.white)
    }
}

#Preview {
    HighlightHeaderView()
}

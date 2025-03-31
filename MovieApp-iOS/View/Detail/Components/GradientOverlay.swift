//
//  GradientOverlay.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct GradientOverlay: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.8), Color.clear]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .frame(height: 70)
            .frame(maxWidth: .infinity)
            .position(x: 215, y: 290)
    }
}

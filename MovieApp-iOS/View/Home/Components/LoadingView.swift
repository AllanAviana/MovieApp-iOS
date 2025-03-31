//
//  LoadingView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI
import SwiftfulLoadingIndicators


struct LoadingView: View {
    var body: some View {
        VStack {
            LoadingIndicator(color: .white, size: .large, speed: .normal)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    LoadingView()
}

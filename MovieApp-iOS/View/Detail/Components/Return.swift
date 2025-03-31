//
//  Return.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct Return: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .frame(width: 40, height: 40)
                .background(Color.black.opacity(0.5))
                .clipShape(Circle())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
    }
}
#Preview {
    Return()
}

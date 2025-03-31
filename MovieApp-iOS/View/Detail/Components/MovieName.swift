//
//  MovieName.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct MovieName: View {
    var name: String = ""
    
    var body: some View {
        HStack {
            Text(name)
                .font(.custom("", size: 16))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
}

//
//  Logo.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 31/03/25.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        HStack {
            Image("LogoHome")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black)
    }
}

#Preview {
    Logo()
}

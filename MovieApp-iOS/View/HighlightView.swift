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
        NavigationStack{
            VStack{
                Text("Highlights")
                    .font(.custom("", size: 64))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                TabView {
                    ForEach(movies, id: \.id) { movie in
                        ZStack {
                            if let url = movie.posterURL {
                                NavigationLink(destination: DetailView(movie: movie)){
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 349, height: 573)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.gray)
                                                .frame(width: 349, height: 573)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .shadow(radius: 5)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(width: 349, height: 573)
                .cornerRadius(60)
                .padding(.top, 32)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
    }
}


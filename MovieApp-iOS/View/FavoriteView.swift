//
//  FavoriteView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    @State private var refreshId = UUID()
    @State private var isVisible: Bool = false

    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Favorite\nMovies")
                    .font(.custom("RedHatDisplay-Bold", size: 40))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.genres.favorite, id: \.id) { movie in
                            VStack {
                                if let url = movie.posterURL,
                                   let uniqueUrl = url.appendingQueryParameter(name: "v", value: "\(Date().timeIntervalSince1970)") {
                                    NavigationLink(destination: DetailView(movie: movie)) {
                                        AsyncImage(url: uniqueUrl) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundColor(.gray)
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        .frame(width: 140, height: 200)
                                        .cornerRadius(8)
                                        .clipped()
                                    }
                                }
                                
                                Text(movie.title)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .frame(width: 120)
                                    .lineLimit(2)
                            }
                            .opacity(isVisible ? 1 : 0)
                            .scaleEffect(isVisible ? 1 : 0.5)
                            .onAppear {
                                isVisible = true
                                
                            }
                            .animation(.easeInOut(duration: 2), value: isVisible)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .id(refreshId)
            .onAppear {
                refreshId = UUID()
            }
        }
    }
}

extension URL {
    func appendingQueryParameter(name: String, value: String) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        var queryItems = components.queryItems ?? []
        queryItems.append(URLQueryItem(name: name, value: value))
        components.queryItems = queryItems
        return components.url
    }
}

//
//  HomeView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = MoviesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack {
                        Spacer().frame(height: 60)
                        
                        RandomMovieImage(ViewModel: viewModel, movie: viewModel.randomMovie() ?? Movie(id: 0, adult: false, backdrop_path: nil, genre_ids: [], original_language: "", original_title: "", overview: "", popularity: 0, poster_path: nil, release_date: nil, title: "", video: false, vote_average: 0, vote_count: 0))
                        
                        VStack(spacing: 24) {
                            GenreRowView(title: "Romance",   movies: viewModel.genres.romance)
                            GenreRowView(title: "Horror",    movies: viewModel.genres.horror)
                            GenreRowView(title: "Ação",      movies: viewModel.genres.action)
                            GenreRowView(title: "Suspense",  movies: viewModel.genres.suspense)
                        }
                        .padding(.vertical)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                
                Logo()
                
            }
        }
        .environmentObject(viewModel)
        .onAppear {
            viewModel.fetchAllGenres()
        }
    }
}



struct GenreRowView: View {
    let title: String
    let movies: [Movie]
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
                .padding(.leading, 16)
            
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(spacing: 16) {
                    ForEach(movies) { movie in
                        VStack {
                            if let url = movie.posterURL {
                                NavigationLink(destination: {}) {
                                    AsyncImage(url: url) { phase in
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
                                    .frame(width: 120, height: 180)
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
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct Logo: View {
    var body: some View {
        HStack{
            Image("LogoHome")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black)
    }
    
}

struct RandomMovieImage: View {
    @ObservedObject var ViewModel: MoviesViewModel
    
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .center) {
            if let url = movie.posterURL {
                NavigationLink(destination: {}) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 397, height: 220)
                                .scaledToFit()
                        case .failure:
                            Image("Placeholder")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 397, height: 220)
                    .cornerRadius(8)
                }
            }
            
            Text(movie.title)
                .font(.custom("", size: 14))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                print("sadas das \(movie)")
            }
        }
        
    }
}


#Preview {
    HomeView()
}


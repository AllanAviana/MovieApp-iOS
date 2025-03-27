//
//  DetailView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI

struct DetailView: View {
    
    let movie: Movie
    @EnvironmentObject var viewModel: MoviesViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack() {
            ZStack(alignment: .top) {
                
                if let url = movie.posterURL {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 430, height: 305)
                        case .failure:
                            Image("Placeholder")
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    MovieName(name: movie.title)
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                Button(action: {
                    dismiss()
                }) {
                    Return()
                }
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.black.opacity(0.8),
                                Color.clear
                            ]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(height: 70)
                    .frame(maxWidth: .infinity)
                    .position(x: 215, y: 290)
            }
            .frame(width: 430, height: 305)
            VStack(alignment: .leading) {
                HStack{
                    Text(movie.vote_average.description + "/10")
                        .font(.custom("", size: 14))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(movie.vote_count) votes")
                        .font(.custom("", size: 14))
                        .foregroundStyle(.white)
                }
                
                HStack {
                    let starCount = Int(round(movie.vote_average / 2))
                    ForEach(0..<starCount, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Spacer()
                    
                    Text("\(movie.formattedReleaseDate)")
                        .font(.custom("", size: 14))
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
                
                Text("\(viewModel.geners(ids: movie.genre_ids))")
                    .font(.custom("", size: 14))
                    .foregroundStyle(.white)
                    .opacity(0.5)
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                if !movie.overview.isEmpty {
                    Text(movie.overview)
                        .font(.custom("", size: 16))
                        .foregroundStyle(.white)
                        .padding(.top, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }else{
                    Text("Descrição não disponível")
                        .font(.custom("", size: 16))
                        .foregroundStyle(.white)
                        .padding(.top, 30)
                        .opacity(0.5)
                }
                
                
            }
            .padding(.horizontal, 25)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Spacer()
            
            HStack{
                Spacer()
                Button(action: {
                    viewModel.favorite(movie: movie)
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 44, height: 44)
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(
                                viewModel.genres.favorite.contains(where: { $0.id == movie.id }) ? Color.red : Color.gray
                            )
                    }
                }
            }
            .padding(20)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
    }
}

struct Return: View {
    var body: some View {
        HStack() {
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

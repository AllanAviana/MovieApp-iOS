//
//  MovieViewModel.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI

class MoviesViewModel: ObservableObject {
    
    @Published var genres = MoviesGenre(
        romance: [],
        horror: [],
        action: [],
        suspense: [],
        allmovies: []
    )
    
    private let apiKey = "1f2fc96071583a9c50c89c207132fbd2"
    private var usedMovieIDs: Set<Int> = []
    
    private func fetchMoviesFor(genreID: Int, completion: @escaping ([Movie]) -> Void) {
        let baseURL = "https://api.themoviedb.org/3/discover/movie"
        let urlString = "\(baseURL)?api_key=\(apiKey)&with_genres=\(genreID)&language=pt-BR&sort_by=popularity.desc"
        
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil || data == nil {
                completion([])
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(MovieSearchResponse.self, from: data!)
                completion(decoded.results)
            } catch {
                completion([])
            }
        }.resume()
    }
    
    func fetchAllGenres() {
        fetchMoviesFor(genreID: 10749) { movies in
            DispatchQueue.main.async {
                let deduplicated = movies.filter { !self.usedMovieIDs.contains($0.id) }
                self.genres.romance = deduplicated
                self.usedMovieIDs.formUnion(deduplicated.map { $0.id })
                self.genres.allmovies.append(contentsOf: deduplicated)
            }
        }
        
        fetchMoviesFor(genreID: 27) { movies in
            DispatchQueue.main.async {
                let deduplicated = movies.filter { !self.usedMovieIDs.contains($0.id) }
                self.genres.horror = deduplicated
                self.usedMovieIDs.formUnion(deduplicated.map { $0.id })
                self.genres.allmovies.append(contentsOf: deduplicated)
            }
        }
        
        fetchMoviesFor(genreID: 28) {  movies in
            DispatchQueue.main.async {
                let deduplicated = movies.filter { !self.usedMovieIDs.contains($0.id) }
                self.genres.action = deduplicated
                self.usedMovieIDs.formUnion(deduplicated.map { $0.id })
                self.genres.allmovies.append(contentsOf: deduplicated)
            }
        }
        
        fetchMoviesFor(genreID: 53) {  movies in
            DispatchQueue.main.async {
                let deduplicated = movies.filter { !self.usedMovieIDs.contains($0.id) }
                self.genres.suspense = deduplicated
                self.usedMovieIDs.formUnion(deduplicated.map { $0.id })
                self.genres.allmovies.append(contentsOf: deduplicated)
            }
        }
    }
    
    func randomMovie() -> Movie? {
        guard !genres.allmovies.isEmpty else { return nil }
        var randomIndex = Int.random(in: 0..<genres.allmovies.count)
        while genres.allmovies[randomIndex].overview == "" {
            randomIndex = Int.random(in: 0..<genres.allmovies.count)
        }
        return genres.allmovies[randomIndex]
    }
}


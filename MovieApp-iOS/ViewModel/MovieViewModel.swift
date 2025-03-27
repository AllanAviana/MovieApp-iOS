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
        allmovies: [],
        favorite: []
    )
    
    @Published var movieDetails = MovieDetails()
    
    
    private let apiKey = "1f2fc96071583a9c50c89c207132fbd2"
    private var usedMovieIDs: Set<Int> = []
    
    init(){
        loadFavorites()
        fetchAllGenres()
    }
    
    private func fetchMoviesFor(genreID: Int, completion: @escaping ([Movie]) -> Void) {
        let baseURL = "https://api.themoviedb.org/3/discover/movie"
        let urlString = "\(baseURL)?api_key=\(apiKey)&with_genres=\(genreID)&language=EN&sort_by=popularity.desc"
        
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
    
    func details(for movie: Movie){
        self.movieDetails.image = movie.posterURL ?? URL(string: "") ?? URL(string: "https://example.com/default.jpg")!
        self.movieDetails.overview = movie.overview
        self.movieDetails.rating = movie.vote_average
        self.movieDetails.name = movie.title
        
    }
    
    func geners(ids: [Int]) -> String {
        let generoFilmes: [Int: String] = [
            28: "Action",
            12: "Adventure",
            16: "Animation",
            35: "Comedy",
            80: "Crime",
            99: "Documentary",
            18: "Drama",
            10751: "Family",
            14: "Fantasy",
            36: "History",
            27: "Horror",
            10402: "Music",
            9648: "Mystery",
            10749: "Romance",
            878: "Science Fiction",
            10770: "TV Movie",
            53: "Thriller",
            10752: "War",
            37: "Western"
        ]
        
        var returnValue: [String] = []
        
        for id in generoFilmes.keys.sorted() {
            if ids.contains(id) {
                returnValue.append(generoFilmes[id]!)
            }
        }

        return returnValue.joined(separator: ", ")
    }
    
    func favorite(movie: Movie) {
        if genres.favorite.contains(where: { $0.id == movie.id }) {
            genres.favorite.removeAll { $0.id == movie.id }
        } else {
            genres.favorite.append(movie)
        }
        saveFavorites()
    }

    func saveFavorites() {
        let defaults = UserDefaults.standard
        do {
            let data = try JSONEncoder().encode(genres.favorite)
            defaults.set(data, forKey: "favoriteMovies")
            print("Saved favorites to UserDefaults: \(genres.favorite.count) filmes")
        } catch {
            print("Erro ao codificar favoritos: \(error)")
        }
    }
    func loadFavorites() {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "favoriteMovies") {
            do {
                let decoded = try JSONDecoder().decode([Movie].self, from: data)
                self.genres.favorite = decoded
                print("Loaded favorites from UserDefaults: \(decoded.count) filmes")
            } catch {
                print("Erro ao decodificar favoritos: \(error)")
            }
        }
    }
}


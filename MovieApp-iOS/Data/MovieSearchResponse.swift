//
//  MovieSearchResponse.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import Foundation

struct MovieSearchResponse: Codable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}

struct Movie: Codable, Identifiable {
    let id: Int
    let adult: Bool
    let backdrop_path: String?
    let genre_ids: [Int]
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String?
    let release_date: String?
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    
    var posterURL: URL? {
        guard let posterPath = poster_path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    var formattedReleaseDate: String {
        return release_date ?? ""
    }
}




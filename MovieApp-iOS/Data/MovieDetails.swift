//
//  MovieDetails.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import Foundation

struct MovieDetails{
    var image: URL = URL(string: "") ?? URL(string: "https://example.com/default.jpg")!
    var name: String = ""
    var rating: Double = 0
    var overview: String = ""
}

//
//  MoviesRepo.swift
//  MARVEL-SWIFTUI
//
//  Created by Hany Karam on 03/03/2024.
//

import Combine
protocol MoviesRepo:WebRepository{
    func featchMovies() -> AnyPublisher<MoviesModel, Error>
}

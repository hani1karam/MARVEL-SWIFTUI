//
//  MoviesUseCase.swift
//  MARVEL-SWIFTUI
//
//  Created by Hany Karam on 03/03/2024.
//

import Combine
protocol MoviesUseCaseProtcol{
    func featchMovies() -> AnyPublisher<MoviesModel, Error>
}
struct MoviesUseCase:MoviesUseCaseProtcol{
    private let moviesRepo: MoviesRepo
    init(moviesRepo: MoviesRepo){
        self.moviesRepo = moviesRepo
    }
    func featchMovies() -> AnyPublisher<MoviesModel,Error>{
        return moviesRepo.featchMovies()
    }
}

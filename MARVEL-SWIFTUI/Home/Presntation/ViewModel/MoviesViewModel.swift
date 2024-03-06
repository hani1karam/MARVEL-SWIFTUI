//
//  MoviesViewModel.swift
//  MARVEL-SWIFTUI
//
//  Created by Hany Karam on 03/03/2024.
//

import Combine
import SwiftUI
protocol MoviesViewModelProtocol {
    func featchMovies()
}
class MoviesViewModel:MoviesViewModelProtocol,ObservableObject{
    var moviesUseCase: MoviesUseCaseProtcol
    @Published var resultMovies:[Result]?
    private var cancellable: AnyCancellable?
    init(moviesUseCase: MoviesUseCaseProtcol) {
        self.moviesUseCase = moviesUseCase
    }
    func featchMovies(){
        cancellable = moviesUseCase.featchMovies().receive(on: DispatchQueue.main)
            .sink { res in
                switch res {
                case .failure(let err):
                    print(err)
                default:
                    break
                }
            } receiveValue: { moviesValue in
                self.resultMovies = moviesValue.data?.results ?? []
            }
    }
}

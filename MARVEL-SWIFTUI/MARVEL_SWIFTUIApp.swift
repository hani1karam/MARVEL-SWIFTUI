//
//  MARVEL_SWIFTUIApp.swift
//  MARVEL-SWIFTUI
//
//  Created by Hany Karam on 01/03/2024.
//

import SwiftUI

@main
struct MARVEL_SWIFTUIApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesView(viewModel: MoviesViewModel(moviesUseCase: MoviesUseCase(moviesRepo: MoviesRepoImpl(session: URLSession.shared, baseURL: "https://gateway.marvel.com"))))
        }
    }
}

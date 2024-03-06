//
//  MoviesView.swift
//  MARVEL-SWIFTUI
//
//  Created by Hany Karam on 01/03/2024.
//

import SwiftUI
import Combine
struct MoviesView: View {
    @ObservedObject var viewModel:MoviesViewModel
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.resultMovies ?? []){allMovies in
                    ZStack{
                        let url = URL(string:allMovies.thumbnail?.url ?? "")
                        AsyncImage(url: url,content:{retunredImage in
                            retunredImage
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth:.infinity,maxHeight: .infinity)
                                .cornerRadius(5)
                        },placeholder: {
                            ProgressView()
                        })
                        Text(allMovies.name ?? "")
                            .background(.white)
                            .padding(.top,UIScreen.main.bounds.height/3.8)
                            .frame(width: 300, height: 300, alignment: .leading)
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
            .listRowSeparator(.hidden)
            .listRowSpacing(10)
            .navigationTitle("All Movies")
            .onAppear {
                viewModel.featchMovies()
            }
        }
    }
}

#Preview {
    MoviesView(viewModel: MoviesViewModel(moviesUseCase: MoviesUseCase(moviesRepo: MoviesRepoImpl(session: URLSession.shared, baseURL: "https://gateway.marvel.com"))))
}

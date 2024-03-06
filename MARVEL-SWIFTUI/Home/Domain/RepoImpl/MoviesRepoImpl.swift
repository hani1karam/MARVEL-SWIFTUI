//
//  MoviesRepoImpl.swift
//  MARVEL-SWIFTUI
//
//  Created by Hany Karam on 03/03/2024.
//

import Combine
import Foundation

struct MoviesRepoImpl: MoviesRepo{
    let session: URLSession
    let baseURL: String
    let bgQueue = DispatchQueue(label: "bg_parse_queue")
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    func featchMovies() -> AnyPublisher<MoviesModel, Error> {
        return call(endpoint: API.allmovies)
    }
}
// MARK: - Endpoints

extension MoviesRepoImpl {
    enum API {
        case allmovies
    }
}

extension MoviesRepoImpl.API: APICall {
    var path: String {
         let timestamp = Date().timeIntervalSince1970
         let publickey = "9262f52ae0881dd999dc378558b672f1"
         let privatekey = "0945cb86380b1b3395459fd8caf982b0f973ef2d"
         let hash = "\(timestamp)\(privatekey)\(publickey)".md5
        switch self {
        case .allmovies:
            return "/v1/public/characters?ts=\(timestamp)&apikey=\(publickey)&hash=\(hash)"
        }
    }
    var method: String {
        switch self {
        case .allmovies:
            return "GET"
        }
    }
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    func body() throws -> Data? {
        return nil
    }
}

//
//  APIManager.swift
//  SwiftUIAsyncAwait
//
//  Created by Rohit Kumar on 19/07/2024.
//

import Foundation

typealias Hander<T> = (Result<T, NetworkError>) -> Void

enum NetworkError: Error {
    
    case invalidResponse
    case invalidURL
    case invalidData
    case decodingError
    case network(Error?)
}

enum EndPoint {
    case users
    case posts
    case comments
    case albums
    case photos
    case todos
}

protocol ServiceRequest {
    var path: String { get }
    var method: RequestMethod { get }
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


extension EndPoint: ServiceRequest {
    var method: RequestMethod {
        switch self {
        case .users:
            return .get
        case .posts:
            return .post
        case .comments:
            return .get
        case .albums:
            return .get
        case .photos:
            return .get
        case .todos:
            return .get
        }
    }
    
    
    var path: String {
        switch self {
        case .users:
            return "https://jsonplaceholder.typicode.com/users"
        case .posts:
            return "https://jsonplaceholder.typicode.com/posts"
        case .comments:
            return "https://jsonplaceholder.typicode.com/comments"
        case .albums:
            return "https://jsonplaceholder.typicode.com/albums"
        case .photos:
            return "https://jsonplaceholder.typicode.com/photos"
        case .todos:
            return "https://jsonplaceholder.typicode.com/todos"
        }
    }
}


class APIManager {
    
    func fetchUsers<T: Decodable>(urlString: String = userURL, modelType: T.Type, completionHandler: @escaping Hander<T>) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            do {
                let urlResponse = try JSONDecoder().decode(modelType, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(urlResponse))
                }
            } catch {
                print("User Fetch Api Error", error)
                completionHandler(.failure(.network(error)))
            }
            
            
        }.resume()
        
    }
    
    func request<T:Decodable>(url: String) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}

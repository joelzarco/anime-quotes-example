//
//  ApiManager.swift
//  AnimeQuotes
//
//  Created by Johel Zarco on 19/10/22.
//

import Foundation

final class ApiManager{
    private enum ApiError : Error{
        case invalidURL
    }
    
    func getData<T : Decodable>(url : String, model : T.Type, completion : @escaping(Result<T, Error>) -> () ){
        // check for invalid url
        guard let url = URL(string: url) else{
            completion(.failure(ApiError.invalidURL))
            return
        }
        // Create URL session
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data else{
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            do{
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(serverData))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
}

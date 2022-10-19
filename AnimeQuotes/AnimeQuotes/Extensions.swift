//
//  Extensions.swift
//  AnimeQuotes
//
//  Created by Johel Zarco on 18/10/22.
//

import Foundation

// in order to decode json data

extension Bundle{
    
    func decode<T : Decodable>(file : String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Could NOT find \(file) in the bundle")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Could NOT load \(file) from bundle")
        }
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else{
            fatalError("Could not decode \(file) from the bundle")
        }
        
        return loadedData
    }
}

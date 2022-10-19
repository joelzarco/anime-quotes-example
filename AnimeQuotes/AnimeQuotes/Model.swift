//
//  model.swift
//  AnimeQuotes
//
//  Created by Johel Zarco on 18/10/22.
//

import Foundation

struct Quote : Decodable, Identifiable{
    var id = UUID()
    let anime : String
    let character : String
    let quote : String
    
    // id should not be search in json data
    private enum CodingKeys : String, CodingKey{
        case anime, character, quote
    }
    
    static var SampleQuotes : [Quote] = Bundle.main.decode(file: "quotes.json")
    static var SampleQuote = SampleQuotes.first!
}

//
//  ContentView.swift
//  AnimeQuotes
//
//  Created by Johel Zarco on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    
    let quotes = Quote.SampleQuotes
    
    var body: some View {
        NavigationView{
            List{
                ForEach(quotes){q in
                    ItemView(quote: q)
                        .padding(4)
                }
            }
            .navigationTitle("Anime Quotes")
            .refreshable {
                // still needs to implement api call
            }
        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

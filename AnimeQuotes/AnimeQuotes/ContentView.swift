//
//  ContentView.swift
//  AnimeQuotes
//
//  Created by Johel Zarco on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel(testMode: false)
//    let quotes = Quote.SampleQuotes
    
    var body: some View {
        NavigationView{
            List{
                ForEach(vm.quotes){q in
                    ItemView(quote: q)
                        .padding(4)
                }
            }
            .navigationTitle("Anime Quotes")
            .refreshable {
                // still needs to implement api call
                vm.makeApiRequest()
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

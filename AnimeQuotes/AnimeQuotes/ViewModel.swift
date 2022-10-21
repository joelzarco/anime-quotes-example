//
//  ViewModel.swift
//  AnimeQuotes
//
//  Created by Johel Zarco on 19/10/22.
//

import Foundation

final class ViewModel : ObservableObject{
    
    @Published var quotes = [Quote]()
    
    private let baseUrl = "https://animechan.vercel.app/api/quotes"
    private let apiManager = ApiManager()
    
    init(testMode : Bool){
        testMode ? makeFakeApiRequest() : makeApiRequest()
    }
    
    func makeFakeApiRequest(){
        self.quotes = Quote.SampleQuotes
    }
    
    func makeApiRequest(){
        apiManager.getData(url: baseUrl, model: [Quote].self){ [weak self] result in
            // avoid retain cycles
            // unwrapp self
            guard let self = self else{return}
            DispatchQueue.main.async {
                switch(result){
                case.success(let quotes):
                    self.quotes = quotes
                case.failure(let error):
                    let errrorQuote = Quote(anime: "Error", character: "Error", quote: "Something went wrong :( \(error.localizedDescription)")
                    self.quotes = [errrorQuote]
                    print(error)
                }
            }
        }
    }
    
    
}

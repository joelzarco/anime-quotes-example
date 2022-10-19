//
//  ItemView.swift
//  AnimeQuotes
//
//  Created by Johel Zarco on 18/10/22.
//

import SwiftUI

struct ItemView: View {
    
    let quote : Quote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            HStack{
                Text(quote.anime)
                    .font(.headline)
                Spacer()// push anime name to the left
            }
            Divider()
            Text(quote.quote)
                .font(.body)
            
            HStack{
                Spacer()// push character to the right
                Text("- \(quote.character)")
                    .font(.headline)
            }
        }
        .padding()
    }
}

//struct ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemView()
//    }
//}

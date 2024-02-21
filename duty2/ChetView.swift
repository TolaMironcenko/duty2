//
//  ChetView.swift
//  duty2
//
//  Created by Анатолий Миронченко on 21.02.2024.
//

import SwiftUI

struct ChetView: View {
    let chet: Chet
    @Binding var allChets: [Chet]
    @Binding var mainChet: Chet
    
    var body: some View {
        VStack {
            (Text("\(chet.name): \(chet.balance, specifier: "%.2f")") + Text(Image(systemName: "rublesign")))
                .padding()
            Button("Delete", action: {
                withAnimation(.linear(duration: 0.2)) {
                    if (!deleteChet(name: chet.name)) {
                        print("error")
                    }
                    allChets = getAllChets()
                    mainChet = getChet(name: "main")
                }
            })
            .padding()
            .foregroundColor(.white)
        }
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.gray)
            .shadow(radius: 10, x: 5, y: 5))
    }
}

#Preview {
    ChetView(chet: Chet(name: "mom", balance: 100), allChets: .constant([Chet(name: "mom", balance: 100)]), mainChet: .constant(Chet(name: "main", balance: 100)))
}

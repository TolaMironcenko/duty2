//
//  ContentView.swift
//  duty2
//
//  Created by Анатолий Миронченко on 21.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State public var allChets: [Chet] = getAllChets()
    @State public var mainChet: Chet = getChet(name: "main")
    @State var isPresentedAddTransaction: Bool = false
    
    var body: some View {
        TopBarView(mainChet: $mainChet)
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(allChets) { chet in
                        ChetView(chet: chet, allChets: $allChets, mainChet: $mainChet)
                    }
                }
            }
        }
        .padding()
        Spacer()
        HStack {
            Spacer()
            Button(action: {
                isPresentedAddTransaction = true
            }, label: {
                Text(Image(systemName: "plus"))
                #if os(macOS)
                    .padding(10)
                #elseif os(iOS)
                    .padding()
                #endif
                    .foregroundColor(.white)
            })
            .background(.gray)
            .clipShape(Circle())
            .popover(isPresented: $isPresentedAddTransaction, content: {
                Text("hello")
            })
        }
        .padding(10)
    }
}

#Preview {
    ContentView()
}

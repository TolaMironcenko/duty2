//
//  TopBarView.swift
//  duty2
//
//  Created by Анатолий Миронченко on 21.02.2024.
//

import SwiftUI

struct TopBarView: View {
    @Binding var mainChet: Chet
    var body: some View {
        HStack (alignment: .center) {
            VStack (alignment: .leading) {
                Text("Balance")
                    .font(.caption)
                (Text("\(mainChet.balance, specifier: "%.2f")") + Text(Image(systemName: "rublesign")))
                    .font(.title3)
                    .fontWeight(.heavy)
            }
            Spacer()
        }
        .padding(10)
        .background(.gray)
    }
}

#Preview {
    TopBarView(mainChet: .constant(Chet(name: "main", balance: 100)))
}

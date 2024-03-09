//
//  TopBarView.swift
//  duty2
//
//  Created by Анатолий Миронченко on 21.02.2024.
//

import SwiftUI

struct TopBarView: View {
    @Binding var mainChet: Chet
    @Binding var allTransactions: [Transaction]
    
    var body: some View {
        HStack (alignment: .center) {
            VStack (alignment: .leading) {
                Text(String(localized: "balance"))
                    .font(.caption)
                (Text("\(mainChet.balance, specifier: "%.2f")") + Text(Image(systemName: "rublesign")))
                    .font(.title3)
                    .fontWeight(.heavy)
            }
            Spacer()
        }
        .padding(10)
        .background(.gray)
        .onTapGesture {
            withAnimation(.linear(duration: 0.2)) {
                allTransactions = getTransactionsForChet(chet: "main")
            }
        }
    }
}

#Preview {
    TopBarView(mainChet: .constant(Chet(name: "main", balance: 100)), allTransactions: .constant([Transaction(chet: "main", category: "No category", datetime: getDateTimeNow(), sum: 10)]))
}

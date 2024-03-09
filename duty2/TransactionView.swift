//
//  TransactionView.swift
//  duty2
//
//  Created by Анатолий Миронченко on 24.02.2024.
//

import Foundation

import SwiftUI

struct TransactionView: View {
    var transaction: Transaction
    @Binding var allTransactions: [Transaction]
    
    var body: some View {
        HStack {
            Text("\(transaction.sum, specifier: "%.2f") | \(transaction.datetime) | \(transaction.category)")
            Button(String(localized: "delete"), action: {
                withAnimation(.linear(duration: 0.2)) {
                    _ = deleteTransaction(chet: transaction.chet, id: transaction.id)
                    allTransactions = getTransactionsForChet(chet: "main")
                }
            })
            .background(.red)
            .cornerRadius(10.0)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
        .foregroundColor(.gray)
        .shadow(radius: 10, x: 5, y: 5))
    }
}

#Preview {
    TransactionView(transaction: Transaction(chet: "main", category: "hello", datetime: getDateTimeNow(), sum: 50), allTransactions: .constant([Transaction(chet: "main", category: "hello", datetime: getDateTimeNow(), sum: 50)]))
}

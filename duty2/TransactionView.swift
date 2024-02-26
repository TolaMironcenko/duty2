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
    
    var body: some View {
        Text("\(transaction.sum, specifier: "%.2f") | \(transaction.category)")
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .shadow(radius: 10, x: 5, y: 5))
    }
}

#Preview {
    TransactionView(transaction: Transaction(chet: "main", category: "hello", sum: 50))
}

//
//  AddTransactionView.swift
//  duty2
//
//  Created by Анатолий Миронченко on 25.02.2024.
//

import Foundation
import SwiftUI

struct AddTransactionView: View {
    @State var tChetName: String = "main"
    @State var sum: String = "0"
    @State var category: String = "No Category"
    @Binding var allChets: [Chet]
    @Binding var mainChet: Chet
    @Binding var allTransactions: [Transaction]
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            VStack {
                HStack {
                    Text("Create new transaction")
                        .font(.title)
                }
                VStack (alignment: .leading) {
                    TextField("Chet", text: $tChetName)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                }
                VStack (alignment: .leading) {
                    TextField("Sum", text: $sum)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                }
                VStack (alignment: .leading) {
                    TextField("Category", text: $category)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                }
                Button(action: {
                    withAnimation(.linear(duration: 0.2)) {
                        let sumFloat: Float = (sum as NSString).floatValue
                        _ = createTransaction(chet: tChetName, category: category, sum: sumFloat)
                        allChets = getAllChets()
                        mainChet = getChet(name: "main")
                        allTransactions = getTransactionsForChet(chet: "main")
                        sum = "0"
                        tChetName = ""
                        category = "No category"
                        isPresented = false
                    }
                }) {
                    (Text(Image(systemName: "plus.circle")) + Text(" Add"))
                        .font(.headline)
                        .padding(5)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(minWidth: 200)
            .padding()
        }
    }
}

#Preview {
    AddTransactionView(allChets: .constant([Chet(name: "mom", balance: 100)]), mainChet: .constant(Chet(name: "main", balance: 100)), allTransactions: .constant([Transaction(chet: "main", category: "No category", sum: 0)]), isPresented: .constant(true))
}

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
    @State var allTransactions: [Transaction] = getTransactionsForChet(chet: "main")
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
        
        Text("All transactions")
            .font(.headline)
        ScrollView (.vertical, showsIndicators: false) {
            if (allTransactions.isEmpty) {
                Text("No transactions")
            }
            VStack (alignment: .center) {
                ForEach(allTransactions, id: \.id) { transaction in
                    TransactionView(transaction: transaction)
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
#if os(macOS)
            .popover(isPresented: $isPresentedAddTransaction, content: {
                AddTransactionView(allChets: $allChets, mainChet: $mainChet, allTransactions: $allTransactions, isPresented: $isPresentedAddTransaction)
                
                AddChetView(allChets: $allChets, mainChet: $mainChet, isPresented: $isPresentedAddTransaction)
            })
#elseif os(iOS)
            .sheet(isPresented: $isPresentedAddTransaction, content: {
                AddTransactionView(allChets: $allChets, mainChet: $mainChet, allTransactions: $allTransactions, isPresented: $isPresentedAddTransaction)
                
                AddChetView(allChets: $allChets, mainChet: $mainChet, isPresented: $isPresentedAddTransaction)
            })
#endif
        }
    }
}

#Preview {
    ContentView()
}

//
//  AddChetView.swift
//  duty2
//
//  Created by Анатолий Миронченко on 25.02.2024.
//

import Foundation
import SwiftUI

struct AddChetView: View {
    @State var newChetName: String = ""
    @State var newChetBalance: String = "0"
    @Binding var allChets: [Chet]
    @Binding var mainChet: Chet
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            VStack {
                HStack {
                    Text("Create new chet")
                        .font(.title)
                }
                VStack(alignment: .leading) {
                    TextField(text: $newChetName) {
                        Text("Chet name")
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                }
                VStack(alignment: .leading) {
                    TextField(text: $newChetBalance) {
                        Text("Chet balance")
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                }
                Button(action: {
                    withAnimation(.linear(duration: 0.2)) {
                        if (newChetName != "") {
                            let newChetBalanceFloat: Float = (newChetBalance as NSString).floatValue
                            createChet(name: newChetName, balance: newChetBalanceFloat)
                            allChets = getAllChets()
                            mainChet = getChet(name: "main")
                            newChetName = ""
                        }
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
    AddChetView(allChets: .constant([Chet(name: "mom", balance: 100)]), mainChet: .constant(Chet(name: "main", balance: 100)), isPresented: .constant(true))
}

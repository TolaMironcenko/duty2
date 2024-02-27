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
                    Text(String(localized: "add_chet"))
                        .font(.title)
                }
                VStack(alignment: .leading) {
                    TextField(text: $newChetName) {
                        Text(String(localized: "chet_name"))
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                }
                VStack(alignment: .leading) {
                    TextField(text: $newChetBalance) {
                        Text(String(localized: "sum"))
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                }
                Button(action: {
                    withAnimation(.linear(duration: 0.2)) {
                        if (newChetName != "") {
                            let newChetBalanceFloat: Float = (newChetBalance as NSString).floatValue
                            _ = createChet(name: newChetName, balance: newChetBalanceFloat)
                            allChets = getAllChets()
                            mainChet = getChet(name: "main")
                            newChetName = ""
                        }
                        isPresented = false
                    }
                }) {
                    (Text(Image(systemName: "plus.circle")) + Text(" " + String(localized: "add")))
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

//
//  ContentView.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calculatorViewModel : CurrencyViewModel = CurrencyViewModel()
    @StateObject var symbolViewModel : symbolsViewModel = symbolsViewModel()
    @State var query : QueryModel = QueryModel(from: "USD", to: "EUR", amount: 1)
    @State var result = ""
    @State var toggleSymbols = false
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "dollarsign.circle.fill")
                    .imageScale(.large)
                    .padding(.horizontal, 30)
            }
            Text("\(ConstantsText.currentSearch) \(query.amount) \(query.from) \(ConstantsText.fromAndTo) \(query.to).")
                .multilineTextAlignment(.center)
            if calculatorViewModel.result == 0.0 {
                
            } else {
                Text("\(ConstantsText.result) \(calculatorViewModel.result)")
                    .padding(.vertical, 5)
            }
            Button {
                calculatorViewModel.loadData(query: query)
            } label: {
                //TODO: Cambiar por General Button
                Text("Consultar")
                    .padding(.vertical, 10)
            }
            Spacer()
            VStack {
                VStack {
                    Text(ConstantsText.emptyCurrencies)
                    Toggle("Sólo simbolos", isOn: $toggleSymbols) // -> Este Toggle cambia entre simbolos y países
                        .frame(width: 200)
                }
                if toggleSymbols {
                    List(symbolViewModel.symbolsList.keys.sorted(), id: \.self) {symbol in
                        Text(symbol)
                    }.frame(height: 500)
                } else {
                    List(symbolViewModel.symbolsList.values.sorted(), id: \.self) {symbol in
                        Text(symbol)
                    }.frame(height: 500)
                }
            }.animation(.easeInOut, value: toggleSymbols) // -> Esta animación suaviza un poco el cambio visual entre simbolos y países
                .listStyle(.inset) // -> Este es el estilo de lista, pueden cambiarlo por ejemplo a .automatic para que vean la diferencia
            Spacer()
            Text("\(ConstantsText.canConvert) \(symbolViewModel.symbolsList.count) \(ConstantsText.worldMoney)")
                .padding(.bottom, 20)
                .padding(.horizontal, 10)
                .lineLimit(2)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

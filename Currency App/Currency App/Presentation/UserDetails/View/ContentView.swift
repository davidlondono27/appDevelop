//
//  ContentView.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calculatorViewModel : currencyViewModel = currencyViewModel()
    @StateObject var symbolViewModel : symbolsViewModel = symbolsViewModel()
    @State var result = ""
    @State var amount = 0
    @State var toggleSymbols = false
    @State var origenCurrency = ""
    @State var destinoCurrency = ""
    @State var query : QueryModel = QueryModel(from: "USD", to: "EUR", amount: 1)
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "dollarsign.circle.fill")
                    .imageScale(.large)
                    .padding(.horizontal, 30)
            }
            Spacer()
            VStack {
                VStack {
                    Text(ConstantsText.emptyCurrencies)
                    Toggle(isOn: $toggleSymbols) { // -> Este Toggle cambia entre simbolos y países
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                        Text(ConstantsText.soloSimbolos)
                    }
                    .frame(width: 200)
                }.onTapGesture {
                    toggleSymbols.toggle() // -> Hace que el texto superior tambien pueda presionarse
                }
                
                List {
                    Section {
                        Picker(ConstantsText.origen, selection: $origenCurrency) {
                            ForEach(symbolViewModel.symbolsList.keys.sorted(), id: \.self){ symbol in
                                if toggleSymbols {
                                    Text(symbol)
                                } else {
                                    Text(symbolViewModel.symbolsList[symbol] ?? "")
                                }
                            }
                        }
                    } header: {
                        Text(ConstantsText.origen)
                    }
                    Section {
                        Picker(ConstantsText.destino, selection: $destinoCurrency) {
                            ForEach(symbolViewModel.symbolsList.keys.sorted(), id: \.self){ symbol in
                                if toggleSymbols {
                                    Text(symbol)
                                } else {
                                    Text(symbolViewModel.symbolsList[symbol] ?? "")
                                }
                            }
                        }
                    } header: {
                        Text(ConstantsText.destino)
                    }
                }.animation(.easeInOut, value: toggleSymbols) // -> Esta animación suaviza un poco el cambio visual entre simbolos y países
                    .listStyle(.inset) // -> Este es el estilo de lista, pueden cambiarlo por ejemplo a .automatic para que vean la diferencia
                Text("\(ConstantsText.currentSearch) \(query.amount) \(origenCurrency) \(ConstantsText.fromAndTo) \(destinoCurrency).")
                    .multilineTextAlignment(.center)
                TextField(ConstantsText.cantidadIngresar, value: $amount, formatter: formatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding().keyboardType(.numberPad)
                    
                Button {
                    query = QueryModel(from: origenCurrency, to: destinoCurrency, amount: amount)
                    calculatorViewModel.loadData(query: query)
                } label: {
                    //TODO: Cambiar por General Button
                    Text(ConstantsText.consultar)
                        .padding(.vertical, 10)
                }
                if calculatorViewModel.result == 0.0 {
                    
                } else {
                    Text("\(ConstantsText.result) \(calculatorViewModel.result)")
                        .padding(.vertical, 5)
                }
            }
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

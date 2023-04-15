//
//  ContentView.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calculatorViewModel : CurrencyViewModel = CurrencyViewModel()
    @State var name = "David"
    @State var inputUser = ""
    @State var query : QueryModel = QueryModel(from: "USD", to: "EUR", amount: 1)
    @State var result = ""
    
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "dollarsign.circle.fill")
                .imageScale(.large)
                .padding(.bottom, 5)
            Text("Hola!\n Estás consultando \(query.amount) \(query.from) en \(query.to).")
                .multilineTextAlignment(.center)
            Text("Resultado: \(calculatorViewModel.result)")
                .padding(.vertical, 20)
            Spacer()
            Button {
                calculatorViewModel.loadData(query: query)
                //requestValue(result: &result)
            } label: {
                //                    generalButton(buttonImage: "network", buttonText: "Consultar!")
                Text("consultar")
            }
            Spacer()
        }
    }
    /*
    func requestValue(result: inout String) {
        let calculator = CurrencyViewModel()
         calculator.loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("Desde request: \(calculator.currencyResponse)")
        }
        result = String(calculator.currencyResponse.result)
    }*/
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

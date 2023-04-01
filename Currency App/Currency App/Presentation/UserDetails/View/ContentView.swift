//
//  ContentView.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 11/03/23.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var calculator : CalculatorViewModel = CalculatorViewModel()
    @State var name = "David"
    @State var inputUser = ""
    @State var query : QueryModel = QueryModel(from: "EUR", to: "USD", amount: 1)
    @State var result = ""
    
    var body: some View {
            VStack {
                Spacer()
                Image(systemName: "dollarsign.circle.fill")
                    .imageScale(.large)
                    .padding(.bottom, 5)
                Text("\(ConstantsText_ES.welcome)!\n Estás consultando \(query.amount) \(query.from) en \(query.to).")
                    .multilineTextAlignment(.center)
                
                Text("Resultado: \(result)")
                    .padding(.vertical, 20)
                Spacer()
                Button {
                    requestValue(query: query, result: &result)
                } label: {
                    generalButton(buttonImage: "network", buttonText: "Consultar!")
                }
                Spacer()
            }
    }
    
    func requestValue(query: QueryModel, result: inout String) {
        let calculator = CalculatorViewModel()
        calculator.queryItems = query
        calculator.loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("Desde request: \(calculator.calculatorResponse)")
        }
        result = String(calculator.calculatorResponse.result)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

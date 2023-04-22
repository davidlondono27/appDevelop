//
//  calculatorViewModel.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 2/04/23.
//

import Foundation

class currencyViewModel: ObservableObject {
    @Published var result: Double = 0.0
    @Published var errorResponse = ""
    var headers = Headers()
    var parameters: Data = Data()
    
    func loadData(query: QueryModel) {
        var url = URLComponents(string: ConstantsConfiguration.apiEndPoint + ConstantsConfiguration.calculatorEndPoint)
        //TODO: Los valores se deben reemplazar desde la pantalla inicio
        url?.queryItems = [
            URLQueryItem(name: ConstantsText.to, value: query.to),
            URLQueryItem(name: ConstantsText.from, value: query.from),
            URLQueryItem(name: ConstantsText.amount, value: String(query.amount))
        ]
        let request = headers.headers(url: (url?.url)!, method: ConstantsConfiguration.GET, key: ConstantsConfiguration.apiKey, body: parameters.self)
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: request) {data, response, error in
            if let _ = error {
                self.errorResponse = ConstantsText.errorConnection
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let responseDataModel = try! JSONDecoder().decode(CalculatorModel.self, from: data)
                DispatchQueue.main.async {
                    print(responseDataModel)
                    self.result = responseDataModel.result
                }
            } else if let _ = data,
                      let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 400 {
                self.errorResponse = ConstantsText.errorConnection
            }
        }.resume()
        
    }
}

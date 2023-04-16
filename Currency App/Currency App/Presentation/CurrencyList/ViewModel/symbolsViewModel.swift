//
//  symbolsViewModel.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 15/04/23.
//

import Foundation

class symbolsViewModel: ObservableObject {
    @Published var symbolsList: [String:String] = [:]
    init() {
        loadData()
    }
    func loadData() {
        guard let url = Bundle.main.url(forResource: ConstantsConfiguration.symbolsPath, withExtension: ConstantsText.json) else {
            debugPrint(ConstantsText.errorJSON)
            return
        }
        let data =  try? Data(contentsOf: url)
        
        let symbols = try? JSONDecoder().decode(symbolsModel.self, from: data!)
        self.symbolsList = (symbols?.symbols)!
//        print(symbols)
    }
}

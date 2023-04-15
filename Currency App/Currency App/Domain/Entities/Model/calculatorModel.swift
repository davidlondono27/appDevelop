//
//  calculatorModel.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 2/04/23.
//

import Foundation

struct CalculatorModel: Codable {
    let success: Bool
    let query: QueryModel
    let info: Info
    let date: String
    let result: Double
}

// MARK: - Query
struct QueryModel: Codable {
    let from, to: String
    let amount: Int
}


// MARK: - Info
struct Info: Codable {
    let timestamp: Int
    let rate: Double
}

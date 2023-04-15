//
//  calculatorModel.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 2/04/23.
//

import Foundation

struct CalculatorModel: Decodable {
    let success: Bool
    let query: QueryModel
    let info: Info
    let date: String
    let result: Double
    
    enum CodingKeys: String, CodingKey {

      case success
      case query
      case info
      case date
      case result 
    
    }
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)

        success = try values.decode(Bool.self, forKey: .success)
        query   = try values.decode(QueryModel.self, forKey: .query)
        info    = try values.decode(Info.self, forKey: .info)
        date    = try values.decode(String.self, forKey: .date)
        result  = try values.decode(Double.self, forKey: .result)
   
    }
}

// MARK: - Query
struct QueryModel: Decodable {
    let from, to: String
    let amount: Int
}


// MARK: - Info
struct Info: Decodable {
    let timestamp: Int
    let rate: Double
}

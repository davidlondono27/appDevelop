//
//  symbolsModel.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 15/04/23.
//

import Foundation

struct symbolsModel: Codable {
    let success: Bool
    let symbols: [String: String]
}

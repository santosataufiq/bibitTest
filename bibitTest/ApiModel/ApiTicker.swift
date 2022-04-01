//
//  Ticker.swift
//  bibitTest
//
//  Created by harrie yusuf on 31/03/22.
//

import Foundation

struct ApiTiker: Codable {
    let coinInfo: ApiCoinInfo
}

struct ApiCoinInfo: Codable {
    let name: String
    let fullName: String
    let blockNumber: Int
    let maxSupply: Double
}

extension ApiTiker {
    func toDomain() -> Tiker {
        Tiker(name: coinInfo.name,
              fullName: coinInfo.fullName,
              currency: "USD",
              blockNumber: coinInfo.blockNumber,
              maxSupply: coinInfo.maxSupply)
    }
}

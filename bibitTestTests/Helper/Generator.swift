//
//  Generator.swift
//  bibitTestTests
//
//  Created by harrie yusuf on 01/04/22.
//

@testable import bibitTest

struct Generator {
    private let words: [String] = ["Aku", "Kalau", "sampai", "waktuku", "Ku", "mau", "tak", "seorang", "kan", "merayu"]
    
    func word() -> String {
        return words.randomElement()!
    }
    
    func number() -> Int {
        return Int.random(in: 1...100)
    }
    
    func tiker() -> Tiker {
        Tiker(name: word(),
              fullName: word(),
              currency: word(),
              blockNumber: number(),
              maxSupply: Double(number()))
    }
    
    func apiTiker() -> ApiTiker {
        ApiTiker(coinInfo: ApiCoinInfo(name: word(),
                                       fullName: word(),
                                       blockNumber: number(),
                                       maxSupply: Double(number())))
    }
}

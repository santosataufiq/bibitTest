//
//  BasicResponse.swift
//  bibitTest
//
//  Created by harrie yusuf on 31/03/22.
//

import Foundation

struct BasicResponse<T: Codable>: Codable {
    let message: String
    let data: T
}

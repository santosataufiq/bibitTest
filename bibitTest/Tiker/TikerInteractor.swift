//
//  TikerInteractor.swift
//  bibitTest
//
//  Created by harrie yusuf on 31/03/22.
//

import Foundation

enum ApiResult<T> {
    case success(T)
    case error(String)
}

protocol TikerInteractorInterface {
    func loadData(result: @escaping (ApiResult<[ApiTiker]>) -> Void)
}

final class TikerInteractor: TikerInteractorInterface {
    func loadData(result: @escaping (ApiResult<[ApiTiker]>) -> Void) {
        guard let url = URL(string: "https://min-api.cryptocompare.com/data/top/totaltoptiervolfull?limit=50&tsym=USD") else {
            return
        }
        var request = URLRequest(url: url)
        request.addValue("06ea84698ceee3fde0c88365941cab5747f399d1e603c377aac411a1545697f9",
                         forHTTPHeaderField: "authorization")
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    DispatchQueue.main.async {
                        result(.error(error.localizedDescription))
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        result(.error("cant parse data from api"))
                    }
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromPascalCase
                    let response = try decoder.decode(BasicResponse<[ApiTiker]>.self, from: data)
                    DispatchQueue.main.async {
                        result(.success(response.data))
                    }
                } catch {
                    DispatchQueue.main.async {
                        result(.error(error.localizedDescription))
                    }
                }
            }.resume()
        }
    }
}

extension JSONDecoder.KeyDecodingStrategy {
    static var convertFromPascalCase: JSONDecoder.KeyDecodingStrategy {
        return .custom { keys -> CodingKey in
            let key = keys.last!
            guard key.intValue == nil else {
                return key
            }

            let codingKeyType = type(of: key)
            let newStringValue = key.stringValue.firstCharLowercased()

            return codingKeyType.init(stringValue: newStringValue)!
        }
    }
}

extension String {
    func firstCharLowercased() -> String {
        prefix(1).lowercased() + dropFirst()
    }
}

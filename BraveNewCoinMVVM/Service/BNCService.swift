//
//  BNCService.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

class BNCService
{
    
    func fetchMarket(completion: @escaping (Result<MarketResponses, NetworkErrors>) -> Void)
    
    //Send request to api and decode the result
    func dataRequest<T:Decodable>(_ requestType: RequestType, completion: @escaping(Result<T,NetworkErrors>)->Void)
    {
        URLSession.shared.dataTask(with: requestType.createMarketAssetURLRequest()!) { data, _, error in
            if let _ = error
            {
                completion(.failure(.failed))
            }
            
            guard let data = data else {
                completion(.failure(.badRequest))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.unableToDecode))
            }

        }.resume()
    }
}

//
//  BNCService.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

protocol BNCServiceProtocol
{
    func fetchToken(completion: @escaping (Result<TokenResponses, NetworkErrors>) -> Void)
    func fetchMarket(completion: @escaping (Result<MarketResponses, NetworkErrors>) -> Void)
    func fetchAsset(completion: @escaping(Result<AssetResponses, NetworkErrors>) -> Void)
}

class BNCService : BNCServiceProtocol
{
    func fetchToken(completion: @escaping (Result<TokenResponses, NetworkErrors>) -> Void)
    {
        tokenRequest(RequestType.token, completion: completion)
    }
    
    func fetchMarket(completion: @escaping (Result<MarketResponses, NetworkErrors>) -> Void)
    {
        dataRequest(RequestType.market, completion: completion)
    }
    
    func fetchAsset(completion: @escaping(Result<AssetResponses, NetworkErrors>) -> Void)
    {
        dataRequest(RequestType.asset, completion: completion)
    }
    
    func fetchMarketDetail(completion: @escaping(Result<MarketDetailResponses, NetworkErrors>) -> Void)
    {
        detailDataRequest(RequestType.market, completion: completion)
    }
    
    //Send request to api and decode the result
    func detailDataRequest<T:Decodable>(_ requestType: RequestType, completion: @escaping(Result<T,NetworkErrors>)->Void)
    {
        URLSession.shared.dataTask(with: requestType.createMarketAssetDetailURLRequest()!) { data, _, error in
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
    
    func tokenRequest<T:Decodable>(_ requestType: RequestType, completion: @escaping(Result<T,NetworkErrors>)->Void)
    {
        URLSession.shared.dataTask(with: requestType.createTokenURLRequest()!) { data, _, error in
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

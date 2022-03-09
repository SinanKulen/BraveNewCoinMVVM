//
//  BNCService.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

protocol NetworkServiceProtocol
{
    func fetchToken(completion: @escaping (Result<TokenResponses, NetworkErrors>) -> Void)
    func fetchMarketList(completion: @escaping (Result<MarketResponses, NetworkErrors>) -> Void)
    func fetchAssetList(completion: @escaping(Result<AssetResponses, NetworkErrors>) -> Void)
    func fetchMarketDetail(id: String, completion: @escaping(Result<MarketDetailResponses, NetworkErrors>) -> Void) 
    func fetchAssetDetail(id: String, completion: @escaping(Result<AssetDetailResponses, NetworkErrors>) -> Void)
}

class NetworkService : NetworkServiceProtocol
{
    func fetchToken(completion: @escaping (Result<TokenResponses, NetworkErrors>) -> Void) {
        tokenRequest(RequestType.token, completion: completion)
    }
    
    func fetchMarketList(completion: @escaping (Result<MarketResponses, NetworkErrors>) -> Void) {
        dataRequest(RequestType.market, completion: completion)
    }
    
    func fetchAssetList(completion: @escaping(Result<AssetResponses, NetworkErrors>) -> Void) {
        dataRequest(RequestType.asset, completion: completion)
    }
    
    func fetchMarketDetail(id: String, completion: @escaping(Result<MarketDetailResponses, NetworkErrors>) -> Void) {
        detailDataRequest(RequestType.market, detailId: id, completion: completion)
    }
    
    func fetchAssetDetail(id: String, completion: @escaping(Result<AssetDetailResponses, NetworkErrors>) -> Void) {
        detailDataRequest(RequestType.asset, detailId: id, completion: completion)
    }
    
    func detailDataRequest<T:Decodable>(_ requestType: RequestType, detailId : String, completion: @escaping(Result<T,NetworkErrors>)->Void) {
        guard let request = requestType.createMarketAssetDetailURLRequest(id: detailId) else {
            completion(.failure(.failed))
            return
        }
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
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
            } catch let decodingError{
                print(decodingError.localizedDescription)
                completion(.failure(.unableToDecode))
            }
        }.resume()
    }
    
    func dataRequest<T:Decodable>(_ requestType: RequestType, completion: @escaping(Result<T,NetworkErrors>)->Void) {
        guard let request = requestType.createMarketAssetURLRequest() else {
            completion(.failure(.failed))
            return
        }
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
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
            } catch let decodingError{
                print(decodingError)
                completion(.failure(.unableToDecode))
            }

        }.resume()
    }
    
    func tokenRequest<T:Decodable>(_ requestType: RequestType, completion: @escaping(Result<T,NetworkErrors>)->Void) {
        
        guard let request = requestType.createTokenURLRequest() else {
            completion(.failure(.failed))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
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
            } catch let decodingError {
                print(decodingError.localizedDescription)
                completion(.failure(.unableToDecode))
            }

        }.resume()
    }
}

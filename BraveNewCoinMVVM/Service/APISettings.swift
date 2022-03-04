//
//  APISettings.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

enum HttpMethod: String
{
    case get = "GET"
    case post = "POST"
}

protocol APISetting
{
    var httpMethodGet : HttpMethod { get }
    var httpMethodPost : HttpMethod { get }
    var scheme : String { get }
    var host : String { get }
    var path : String { get }
    var headerGet : [String:String] { get }
    var headerPost : [String:String] { get }
    var parameters : [String:Any] { get }
}

extension APISetting
{
    var httpMethodGet : HttpMethod
    {
        return .get
    }
    
    var httpMethodPost : HttpMethod
    {
        return .post
    }
    
    var scheme : String
    {
        return "https"
    }
    
    var host : String
    {
        return "bravenewcoin.p.rapidapi.com"
    }
    
    var headerGet : [String:String]
    {
        return [ "x-rapidapi-host": "bravenewcoin.p.rapidapi.com",
                 "x-rapidapi-key": "f55d81b597mshed87f7780f5ff97p17046cjsna3b381cb7268"]
    }
    
    var headerPost : [String:String]
    {
        return [ "content-type": "application/json",
                                "x-rapidapi-host": "bravenewcoin.p.rapidapi.com",
                 "x-rapidapi-key": "f55d81b597mshed87f7780f5ff97p17046cjsna3b381cb7268"]
    }
    
    var parameters : [String:Any]
    {
        return ["audience"  : "https://api.bravenewcoin.com",
                "client_id" : "oCdQoZoI96ERE9HY3sQ7JmbACfBf55RY",
                "grant_type": "client_credentials"]
    }
    
    func createMarketAssetURLString() -> String
    {
        return "\(scheme)://\(host)\(path))"
    }
    
    func createTokenURLString() -> String
    {
        return "\(scheme)://\(host)\(path))"
    }
    
    func createMarketAssetURLRequest() -> URLRequest?
    {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        if let url = components.url
        {
            var request = URLRequest(url: url)
            request.httpMethod = httpMethodGet.rawValue
            request.allHTTPHeaderFields = headerGet
            return request
        }
        else
        {
            return nil
        }
    }
    
    func createTokenURLRequest() -> URLRequest?
    {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        let bodyData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        if let url = components.url
        {
            var request = URLRequest(url: url)
            request.httpMethod = httpMethodPost.rawValue
            request.allHTTPHeaderFields = headerPost
            request.httpBody = bodyData as Data
            return request
        }
        else
        {
            return nil
        }
    }
}

//
//  BNCApi.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

enum RequestType
{
    case token
    case market
    case asset
    case marketId
    case assetId
}

// Creates path depends on request
extension RequestType : APISetting
{
    var path : String {
        switch self
        {
        case .token :
            return "/oauth/token"
        case .market :
            return "/market"
        case .asset :
            return "/asset"
        case .marketId :
            return "/market/\(MarketId.marketid ?? "")"
        case .assetId :
            return "/asset/\(AssetId.assetid ?? "")"
        }
    }
}

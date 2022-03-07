//
//  MarketDetail.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 5.03.2022.
//

import Foundation

struct MarketDetail: Codable {
    var id, baseAssetId, quoteAssetId: String

}

struct MarketId
{
    static var marketid : String?
    private init() {}
}

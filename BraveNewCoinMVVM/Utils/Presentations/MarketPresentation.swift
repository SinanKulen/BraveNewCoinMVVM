//
//  MarketPresentation.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

final class MarketPresentation: Equatable {
    let id, baseAssetID, quoteAssetID: String
    
    init(market: Market) {
        self.id = market.id
        self.baseAssetID = market.baseAssetID
        self.quoteAssetID = market.quoteAssetID
    }
    
    static func == (lhs: MarketPresentation, rhs: MarketPresentation)-> Bool {
        return lhs.id == rhs.id && lhs.baseAssetID == rhs.baseAssetID && lhs.quoteAssetID == rhs.quoteAssetID
    }
}

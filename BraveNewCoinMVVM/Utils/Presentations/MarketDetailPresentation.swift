//
//  MarketDetailPresentation.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 5.03.2022.
//

import Foundation

final class MarketDetailPresentation : Equatable {
    var id, baseAssetId, quoteAssetId : String
    
    init(marketDetail : MarketDetailResponses) {
        self.id = marketDetail.id
        self.baseAssetId = marketDetail.baseAssetId
        self.quoteAssetId = marketDetail.quoteAssetId
    }
    
    static func == (lhs: MarketDetailPresentation, rhs: MarketDetailPresentation)-> Bool {
        return lhs.id == rhs.id && lhs.baseAssetId == rhs.baseAssetId && lhs.quoteAssetId == rhs.quoteAssetId
    }
}



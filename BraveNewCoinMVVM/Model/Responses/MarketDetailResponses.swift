//
//  MarketDetailResponses.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 5.03.2022.
//

import Foundation

struct MarketDetailResponses: Decodable
{
    private enum RootCodingKeys : String, CodingKey
    {
        case id,baseAssetId,quoteAssetId
    }

    var  marketDetail = MarketDetail(id: "", baseAssetId: "", quoteAssetId: "")
    var id, baseAssetId, quoteAssetId : String

    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        id = try rootContainer.decode(String.self, forKey: .id)
        marketDetail.id = id
        baseAssetId = try rootContainer.decode(String.self, forKey: .baseAssetId)
        marketDetail.baseAssetId = baseAssetId
        quoteAssetId = try rootContainer.decode(String.self, forKey: .quoteAssetId)
        marketDetail.quoteAssetId = quoteAssetId
    }
}

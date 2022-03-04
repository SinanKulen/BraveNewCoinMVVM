//
//  Market.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

import Foundation
//struct Market: Codable {
//    let content: [MarketContent]
//}

// MARK: - Content
struct Market: Codable {
    let id, baseAssetID, quoteAssetID: String

    enum CodingKeys: String, CodingKey {
        case id
        case baseAssetID = "baseAssetId"
        case quoteAssetID = "quoteAssetId"
    }
}

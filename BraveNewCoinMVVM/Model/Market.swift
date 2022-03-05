//
//  Market.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

// MARK: - Content
struct Market: Codable {
    let id, baseAssetID, quoteAssetID: String

    enum CodingKeys: String, CodingKey {
        case id
        case baseAssetID = "baseAssetId"
        case quoteAssetID = "quoteAssetId"
    }
}

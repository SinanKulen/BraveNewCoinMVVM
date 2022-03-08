//
//  AssetDetail.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import Foundation

struct AssetDetail: Decodable {
    var id, name, symbol, slugName, status, type: String
    var url: String?
    var contractAddress: String?
}

struct AssetId {
    static var assetid : String?
    private init() {}
}

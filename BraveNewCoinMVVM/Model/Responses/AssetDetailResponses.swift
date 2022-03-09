//
//  AssetDetailResponses.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import Foundation

struct AssetDetailResponses : Decodable {
    var id, name, symbol, slugName, status, type: String
    var url, contractAddress: String?
}



//
//  AssetPresentation.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

final class AssetPresentation: Equatable
{
    let id, name, symbol, slugName: String
    let url: String?
    let contractAddress: String?
    
    init(asset: Asset)
    {
        self.id = asset.id
        self.name = asset.name
        self.symbol = asset.symbol
        self.slugName = asset.slugName
        self.url = asset.url
        self.contractAddress = asset.contractAddress
    }
    
    static func == (lhs: AssetPresentation, rhs: AssetPresentation)-> Bool
    {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.symbol == rhs.symbol && lhs.slugName == rhs.slugName && lhs.url == rhs.url && lhs.contractAddress == rhs.contractAddress
    }
}

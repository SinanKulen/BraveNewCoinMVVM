//
//  AssetResponses.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

struct AssetResponses : Decodable
{
    private enum RootCodingKeys : String,CodingKey
    {
        case content
    }
    
    let asset : [Asset]
    
    init(asset: [Asset])
    {
        self.asset = asset
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.asset = try rootContainer.decode([Asset].self, forKey: .content)
    }
}

//
//  MarketResponses.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

struct MarketResponses : Decodable
{
    private enum RootCodingKeys : String,CodingKey {
        case content
    }
    
    let market : [Market]
    
    init(market : [Market])
    {
        self.market = market
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.market = try rootContainer.decode([Market].self, forKey: .content)
    }
}

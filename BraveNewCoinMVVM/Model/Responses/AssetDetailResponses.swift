//
//  AssetDetailResponses.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import Foundation

struct AssetDetailResponses : Decodable
{
    private enum RootCodingKeys : String, CodingKey
    {
        case id,name,symbol,slugName,status,type,url,contractAddress
    }
    
    var assetDetail = AssetDetail(id: "", name: "", symbol: "", slugName: "", status: "", type: "", url: "", contractAddress: "")
    var id, name, symbol, slugName, status, type: String
    var url, contractAddress: String?
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        id = try rootContainer.decode(String.self, forKey: .id)
        assetDetail.id = id
        name = try rootContainer.decode(String.self, forKey: .name)
        assetDetail.name = name
        symbol = try rootContainer.decode(String.self, forKey: .symbol)
        assetDetail.symbol = symbol
        slugName = try rootContainer.decode(String.self, forKey: .slugName)
        assetDetail.slugName = slugName
        status = try rootContainer.decode(String.self, forKey: .status)
        assetDetail.status = status
        type = try rootContainer.decode(String.self, forKey: .type)
        assetDetail.type = type
        url = try rootContainer.decode(String.self, forKey: .url)
        assetDetail.url = (url != nil) ? url : ""
        contractAddress = try rootContainer.decode(String.self, forKey: .contractAddress)
        assetDetail.contractAddress = (contractAddress != nil) ? contractAddress : ""
    }
}



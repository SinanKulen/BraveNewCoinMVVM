//
//  AssetDetailPresentation.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import Foundation
import UIKit

final class AssetDetailPresentation : Equatable {
    var id, name, symbol, slugName, status, type: String
    var url, contractAddress: String?
    
    init(assetDetail : AssetDetailResponses) {
        self.id = assetDetail.id
        self.name = assetDetail.name
        self.symbol = assetDetail.symbol
        self.slugName = assetDetail.slugName
        self.status = assetDetail.status
        self.type = assetDetail.type
        self.url = assetDetail.url
        self.contractAddress = assetDetail.contractAddress
    }
    
    static func == (lhs: AssetDetailPresentation, rhs: AssetDetailPresentation)-> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.symbol == rhs.symbol && lhs.slugName == rhs.slugName && lhs.status == rhs.status && lhs.type == rhs.type && lhs.url == rhs.url && lhs.contractAddress == rhs.contractAddress
    }
}

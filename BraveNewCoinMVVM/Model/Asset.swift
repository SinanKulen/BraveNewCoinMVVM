//
//  Asset.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation
// MARK: - Content
struct Asset: Codable {
    let id, name, symbol, slugName: String
    let status: Status
    let type: TypeEnum
    let url: String?
    let contractAddress: String?
}

enum Status: String, Codable {
    case active = "ACTIVE"
}

enum TypeEnum: String, Codable {
    case crypto = "CRYPTO"
    case fiat = "FIAT"
}

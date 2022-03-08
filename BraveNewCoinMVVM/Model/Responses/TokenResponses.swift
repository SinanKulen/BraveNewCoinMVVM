//
//  TokenResponses.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation
import UIKit

struct TokenResponses : Decodable {
    private enum RootCodingKeys : String, CodingKey {
        case accessToken, scope, expiresIn, tokenType
    }
    
    var token = Token(accessToken: "", scope: "", expiresIn: 0, tokenType: "")
    
    var accessToken, scope: String
    var expiresIn: Int
    var tokenType: String
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        accessToken = try rootContainer.decode(String.self, forKey: .accessToken)
        token.accessToken = accessToken
        scope = try rootContainer.decode(String.self, forKey: .scope)
        token.scope = scope
        expiresIn = try rootContainer.decode(Int.self, forKey: .expiresIn)
        token.expiresIn = expiresIn
        tokenType = try rootContainer.decode(String.self, forKey: .tokenType)
        token.tokenType = tokenType
    }
}

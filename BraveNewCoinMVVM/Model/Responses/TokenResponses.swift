//
//  TokenResponses.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation
import UIKit

struct TokenResponses : Decodable {
    var accessToken, scope: String
    var expiresIn: Int
    var tokenType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case scope
        case expiresIn = "expires_in"
        case tokenType = "token_type"
    }
}

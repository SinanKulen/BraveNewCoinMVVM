//
//  TokenResponses.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation
import UIKit

struct TokenResponses : Decodable
{
    //MARK: ERROR
    private enum RootCodingKeys : String, CodingKey
    {
        case content
    }
    
    let token : [Token]
    
    init(token : [Token])
    {
        self.token = token
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        self.token = try rootContainer.decode([Token].self, forKey: .content)
    }
}

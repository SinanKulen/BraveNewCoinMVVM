//
//  AppContainer.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

let appContainer = AppContainer()

class AppContainer
{
    let service : BNCServiceProtocol = BNCService()
    let router = AppRouter()
}

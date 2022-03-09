//
//  AppContainer.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

let appContainer = AppContainer()

final class AppContainer {
    let service : NetworkServiceProtocol = NetworkService()
    let router = AppRouter()
}

//
//  Dados.swift
//  new-alura-viagens
//
//  Created by Ândriu Felipe Coelho on 23/01/20.
//  Copyright © 2020 Ândriu Felipe Coelho. All rights reserved.
//

import Foundation

let amiibos: [AmiiboSimple] = load("amiibo.json")

class HomeInterector {
    func loadList(callback: @escaping ([AmiiboSimple]) -> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            callback(load("amiibo.json"))
        }
    }
}

private struct HomeInterectorKey: InjectionKey {
    static var currentValue: HomeInterector = HomeInterector()
}

extension InjectedValues {
    var homeInterector: HomeInterector {
        get { Self[HomeInterectorKey.self] }
        set { Self[HomeInterectorKey.self] = newValue }
    }
}

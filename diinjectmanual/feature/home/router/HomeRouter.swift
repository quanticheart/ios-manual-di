//
//  AmiiboRouter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation
import SwiftUI

class HomeRouter{
    @Injected(\.homePresenter) var presenter: HomePresenter
    
    func createModule() -> AnyView {
        return AnyView(HomeView(presenter: self.presenter))
    }
    
    func goToDetails(tail:String) -> AnyView {
        return DetailsRouter().createModule(tail: tail)
    }
}

private struct HomeRouterKey: InjectionKey {
    static var currentValue: HomeRouter = HomeRouter()
}

extension InjectedValues {
    var homeRouter: HomeRouter {
        get { Self[HomeRouterKey.self] }
        set { Self[HomeRouterKey.self] = newValue }
    }
}

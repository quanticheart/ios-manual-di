//
//  DetailsRouter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation
import SwiftUI

class DetailsRouter{
    @Injected(\.detailsPresenter) var presenter: DetailsPresenter
    func createModule(tail:String) -> AnyView {
        return AnyView(DetailView(presenter: self.presenter, tail: tail))
    }
}

private struct DetailsRouterKey: InjectionKey {
    static var currentValue: DetailsRouter = DetailsRouter()
}

extension InjectedValues {
    var detailsRouter: DetailsRouter {
        get { Self[DetailsRouterKey.self] }
        set { Self[DetailsRouterKey.self] = newValue }
    }
}

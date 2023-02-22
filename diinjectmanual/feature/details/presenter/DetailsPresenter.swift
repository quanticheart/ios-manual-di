//
//  DetailsPresenter.swift
//  vipertest
//
//  Created by Jonn Alves on 11/02/23.
//

import Foundation
import Combine


class DetailsPresenter : ObservableObject{
    
    @Published var amiibo : Amiibo? = nil
    @Published var error: Bool = false
    
    @Injected(\.detailsRouter) var router: DetailsRouter
    @Injected(\.detailsInterector) var interector: DetailsInterector
    
    func getDetails(tail:String) {
        interector.loadDetail(tail: tail, callback: { amiibo in
            if amiibo == nil {
                self.error = true
            } else {
                self.amiibo = amiibo!
            }
        })
    }
    
    func clear(){
        self.amiibo = nil
    }
}

private struct DetailsPresenterKey: InjectionKey {
    static var currentValue: DetailsPresenter = DetailsPresenter()
}

extension InjectedValues {
    var detailsPresenter: DetailsPresenter {
        get { Self[DetailsPresenterKey.self] }
        set { Self[DetailsPresenterKey.self] = newValue }
    }
}

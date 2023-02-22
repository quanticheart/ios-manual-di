//
//  HomePresenter.swift
//  vipertest
//
//  Created by Jonn Alves on 08/02/23.
//

import Foundation
import SwiftUI
import Combine

class HomePresenter: ObservableObject{
    
    private var amiibosListRaw : [AmiiboSimple] = []
    @Published var amiibosList : [AmiiboSimple] = []
    private var r = [UUID]()
    
    @Injected(\.homeRouter) var router: HomeRouter
    @Injected(\.homeInterector) var interector: HomeInterector
}

extension HomePresenter {
    func loadList() {
        interector.loadList(callback: { list in
            self.amiibosList = list
            self.amiibosListRaw = list
            
        })
    }
    
    func setReaction(_ reaction: String, for item: AmiiboSimple) {
        self.r.appendIfNotContains(item.id)
    }
    
    func statusList(hideVisited:Bool){
        amiibosList = hideVisited ? amiibosList.filter {
            print($0)
            print(r.contains($0.id))
            return !r.contains($0.id)
        } : (amiibosListRaw)
    }
}

private struct HomePresenterKey: InjectionKey {
    static var currentValue: HomePresenter = HomePresenter()
}

extension InjectedValues {
    var homePresenter: HomePresenter {
        get { Self[HomePresenterKey.self] }
        set { Self[HomePresenterKey.self] = newValue }
    }
}


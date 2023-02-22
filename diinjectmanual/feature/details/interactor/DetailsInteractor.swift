//
//  DetailsInteractor.swift


import Foundation

class DetailsInterector {
    func loadDetail(tail:String, callback: @escaping (Amiibo?) -> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let list:[Amiibo] =   load("amiibo.json")
            list.forEach{ amiibo in
                if amiibo.tail == tail {
                    callback(amiibo)
                    return
                }
            }
            
            callback(nil)
        }
    }
}

private struct DetailsInterectorKey: InjectionKey {
    static var currentValue: DetailsInterector = DetailsInterector()
}

extension InjectedValues {
    var detailsInterector: DetailsInterector {
        get { Self[DetailsInterectorKey.self] }
        set { Self[DetailsInterectorKey.self] = newValue }
    }
}

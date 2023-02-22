//
//  ContentView.swift
//  diinjectmanual
//
//  Created by Jonn Alves on 20/02/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        HomeRouter().createModule()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

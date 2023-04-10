//
//  ContentView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import SwiftUI
struct ContentView: View {
    @State var viewState: ViewState = .logIn
    
    var body: some View {
        switch viewState {
        case .logIn:
            LogInView(viewState: $viewState)
            
        case .cantieri:
            CantieriView(viewState: $viewState)
            
        case .operai:
            OperaiView(viewState: $viewState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

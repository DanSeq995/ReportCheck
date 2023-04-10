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
                .preferredColorScheme(.light)
            
        case .cantieri:
            CantieriView(viewState: $viewState)
                .preferredColorScheme(.light)
            
        case .operai:
            OperaiView(viewState: $viewState)
                .preferredColorScheme(.light)
            
        case .mezzi:
            MezziView(viewState: $viewState)
                .preferredColorScheme(.light)
            
        case .lavorazioni:
            LavorazioniView(viewState: $viewState)
                .preferredColorScheme(.light)
            
        case .note:
            NoteView(viewState: $viewState)
                .preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

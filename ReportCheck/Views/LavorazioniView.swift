//
//  LavorazioniView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 11/04/23.
//

import SwiftUI

struct LavorazioniView: View {
    //Variabili di navigazione
    @Binding var viewState: ViewState
    
    //Variabili lavorazione
    @State var lavorazioni: [Lavorazioni] = [Lavorazioni]()
    @State var selectedLavoro: Set<Int> = []
    @State var lavorazioniSelezionate: [Lavorazioni] = [Lavorazioni]()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LavorazioniView_Previews: PreviewProvider {
    static var previews: some View {
        LavorazioniView(viewState: .constant(ViewState .mezzi))
    }
}

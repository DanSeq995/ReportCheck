//
//  OperaiView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 10/04/23.
//

import SwiftUI

struct OperaiView: View {
    //Variabili navigazione
    @Binding var viewState: ViewState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OperaiView_Previews: PreviewProvider {
    static var previews: some View {
        OperaiView(viewState: .constant(ViewState .operai))
    }
}

//
//  ReportView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 11/04/23.
//

import SwiftUI

struct ReportView: View {
    //Variabili di navigazione
    @Binding var viewState: ViewState
    
    //Variabili dei report
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .onAppear{
            createReport()
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(viewState: .constant(ViewState.report))
    }
}

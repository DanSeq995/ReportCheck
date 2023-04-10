//
//  NoteView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 11/04/23.
//

import SwiftUI

struct NoteView: View {
    //Variabili navigazione
    @Binding var viewState: ViewState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(viewState: .constant(ViewState .note))
    }
}

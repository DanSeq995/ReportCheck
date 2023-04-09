//
//  CantieriView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 09/04/23.
//

import SwiftUI

struct CantieriView: View {
    @Binding var viewState: ViewState
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CantieriView_Previews: PreviewProvider {
    static var previews: some View {
        CantieriView(viewState: .constant(ViewState .cantieri))
    }
}

//
//  LogInView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import SwiftUI

struct LogInView: View {
    @Binding var viewState: ViewState
    @StateObject var networkRequest = NetworkRequest()
    
    var body: some View {
        
        VStack{
            Text("Hello")
            
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(viewState: .constant(ViewState .logIn))
    }
}

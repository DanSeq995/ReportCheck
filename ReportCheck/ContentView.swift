//
//  ContentView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import SwiftUI
struct ContentView: View {
    @StateObject var networkRequest = NetworkRequest()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello!")
            ScrollView {
                ForEach(networkRequest.cantieri) { cantiere in
                    Text(cantiere.nazione)
                }
            }
        }
        .padding()
        .onAppear{
            Task{
                try await networkRequest.loadCantieri()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  CantieriView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 09/04/23.
//

import SwiftUI

struct CantieriView: View {
    //Variabili navigazione
    @Binding var viewState: ViewState
    
    //Variabili cantiere
    @State var cantieri: [Cantiere] = [Cantiere]()
    @State private var selected = ""
    
    //Variabili data
    @State var date = Date()
    
    //Variabile alerts
    @State private var showingAlertData = false
    @State private var showingAlertCantiere = false
    
    var body: some View {
        VStack{
            //Date picker
            VStack(alignment: .leading) {
                Text("Data")
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                    .padding(.horizontal)
                    .padding(.horizontal)
                
                DatePicker("", selection: $date, displayedComponents: .date)
                    .padding(.horizontal)
                    .datePickerStyle(.graphical)
                    .background(Color.accentColor.opacity(0.2), in: RoundedRectangle(cornerRadius: 20))
                    .padding()
                    .padding(.horizontal)
                
            }
            Spacer()
            //Cantieri
            Form {
                Picker("Cantiere", selection: $selected) {
                    ForEach(cantieri, id: \.località) { c in
                        Text(c.località).tag(c)
                    }
                    .pickerStyle(.menu)
                }
                .font(Font.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(Color.accentColor)
            }.scrollContentBackground(.hidden)
            
            //Barra di progressione
            HStack{
                Spacer()
                Button(action: {
                    print("Indietro")
                }, label: {
                    if viewState != .cantieri {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.accentColor)
                    }
                })
                
                //Bottone per salvare i dati e andare avanti
                Button(action: {
                    //Salvo le variabili locali in quelle post
                    postDate = formatDateToString()
                    postCantiere = selected
                    
                    //Se è tutto selezionato cambio view
                    if formatDateToString() != "" && selected != "" {
                        viewState = .operai
                    //Altrimenti mostro gli alert
                    } else if formatDateToString() == ""{
                        showingAlertData = true
                    } else if selected == "" {
                        showingAlertCantiere = true
                    }
                }, label: {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.accentColor)
                })
                
                //Alerts
                .alert("Data non selezionata", isPresented: $showingAlertData) {
                    Button("OK", role: .cancel) {
                        showingAlertData = false
                    }
                }
                .alert("Cantiere non selezionato", isPresented: $showingAlertCantiere) {
                    Button("OK", role: .cancel) {
                        showingAlertCantiere = false
                    }
                }
                Spacer()
            }
            Spacer()
        }.onAppear{
            fetchCantieri()
        }
    }
}

struct CantieriView_Previews: PreviewProvider {
    static var previews: some View {
        CantieriView(viewState: .constant(ViewState .cantieri))
    }
}

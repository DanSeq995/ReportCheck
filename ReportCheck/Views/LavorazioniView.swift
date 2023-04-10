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
    
    //Variabile alerts
    @State private var showingAlertNoLavorazioni = false
    @State private var showingAlertNoQuantità = false
    @State private var showingAlertNoAAA = false
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Text("Lavorazioni")
                    .padding(.leading)
                    .padding(.leading)
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                Spacer()
            }
            
            List {
                ForEach(lavorazioni) { lavoro in
                    HStack{
                        Text(lavoro.nome)
                        Spacer()
                        CheckBoxView(isChecked: self.selectedLavoro.contains(lavoro.id),
                                     label: "") {
                            if self.selectedLavoro.contains(lavoro.id) {
                                if let index = lavorazioniSelezionate.firstIndex(of: lavoro) {
                                    lavorazioniSelezionate.remove(at: index)
                                }
                                self.selectedLavoro.remove(lavoro.id)
                            } else {
                                lavorazioniSelezionate.append(lavoro)
                                self.selectedLavoro.insert(lavoro.id)
                            }
                        }
                    }
                }
            }.onAppear{
                fetchLavorazioni()
            }
            .scrollContentBackground(.hidden)
            
            HStack {
                Text("Quantità/Ore")
                    .padding(.leading)
                    .padding(.leading)
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                Spacer()
            }
            
            List {
                ForEach(lavorazioniSelezionate.indices, id: \.self) { index in
                    HStack() {
                        ZStack {
                            RoundedRectangle(cornerRadius: 0)
                                .size(width: 500, height: 30)
                                .opacity(0.0)
                            Text(lavorazioniSelezionate[index].nome)
                        }
                        Spacer()
                            .padding(.horizontal)
                        ZStack {
                            Rectangle()
                                .size(width: 45, height: 22)
                                .stroke(style: .init(lineWidth: 2))
                                .padding(.trailing)
                                .padding(.trailing)
                            
                            TextField("0", text: $lavorazioniSelezionate[index].quantità)
                                .padding(.leading)
                                .keyboardType(.numberPad)
                        }
                        .onTapGesture {
                            endEditing()
                        }
                        Text(lavorazioniSelezionate[index].tipo)
                    }
                    .fixedSize()
                }
            }.scrollContentBackground(.hidden)
            
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    viewState = .cantieri
                }, label: {
                    if viewState != .mezzi {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.accentColor)
                    }
                })
                
                Spacer()
                
                Button(action: {
                    print(lavorazioniSelezionate)
                    if lavorazioniSelezionate != [] {
                        for l in lavorazioniSelezionate{
                            if l.quantità != "" {
                                postLavorazioni = lavorazioniSelezionate
                                print(lavorazioniSelezionate)
                                viewState = .note
                            } else {
                                showingAlertNoQuantità = true
                            }
                        }
                    } else {
                        print("OOOOO")
                        showingAlertNoLavorazioni = true
                    }
                }, label: {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.accentColor)
                })
                //Alerts
                .alert(isPresented: $showingAlertNoLavorazioni) {
                    Alert(
                        title: Text("Non ci sono lavorazioni selezionate"),
                        message: Text("Sicuro di voler procedere comunque?"),
                        primaryButton: .destructive(Text("Si")) {
                            postLavorazioni = lavorazioniSelezionate
                            viewState = .note
                        },
                        secondaryButton: .cancel(Text("No")) {
                            showingAlertNoLavorazioni = false
                        }
                    )
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct LavorazioniView_Previews: PreviewProvider {
    static var previews: some View {
        LavorazioniView(viewState: .constant(ViewState .mezzi))
    }
}

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
    
    //Variabili operai
    @State var operai: [Operai] = [Operai]()
    @State var operaiSelezionati: [Operai] = [Operai]()
    @State var capoSelezionato: [Users] = postUser
    
    //Variabili checkBox
    @State var selectedOperaio: Set<Int> = []
    
    //Variabile alerts
    @State private var showingAlertNoOperai = false
    @State private var showingAlertNoOre = false
    
    var body: some View {
        //Operai
        VStack {
            Spacer()
            HStack {
                Text("Operai")
                    .padding(.leading)
                    .padding(.leading)
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                Spacer()
            }
            List {
                ForEach(operai) { operaio in
                    HStack{
                        Text(operaio.cNomeCompleto)
                        Spacer()
                        CheckBoxView(isChecked: self.selectedOperaio.contains(operaio.id),
                                     label: "") {
                            if self.selectedOperaio.contains(operaio.id) {
                                if let index = operaiSelezionati.firstIndex(of: operaio) {
                                    operaiSelezionati.remove(at: index)
                                }
                                self.selectedOperaio.remove(operaio.id)
                            } else {
                                operaiSelezionati.append(operaio)
                                self.selectedOperaio.insert(operaio.id)
                            }
                        }
                    }
                }
            }.onAppear{
                fetchOperai()
            }
            .scrollContentBackground(.hidden)
            
            
            VStack {
                HStack {
                    Text("Seleziona ore lavorate")
                        .padding(.leading)
                        .padding(.leading)
                        .font(Font.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.accentColor)
                    Spacer()
                }
                
                List {
                    ForEach(capoSelezionato.indices, id: \.self) { index in
                        HStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 0)
                                    .opacity(0.0)
                                Text(capoSelezionato[index].cNomeCompleto)
                            }
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .size(width: 45, height: 35)
                                    .stroke(style: .init(lineWidth: 2))
                                    .padding(.trailing)
                                
                                TextField("0", text: $capoSelezionato[index].oreLavorate)
                                    .padding(.leading)
                                    .keyboardType(.numberPad)
                            }
                            .onTapGesture {
                                endEditing()
                            }
                        }
                    }
                    ForEach(operaiSelezionati.indices, id: \.self) { index in
                        HStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 0)
                                    .opacity(0.0)
                                Text(operaiSelezionati[index].cNomeCompleto)
                            }
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .size(width: 45, height: 35)
                                    .stroke(style: .init(lineWidth: 2))
                                    .padding(.trailing)
                                
                                TextField("0", text: $operaiSelezionati[index].oreLavorate)
                                    .padding(.leading)
                                    .keyboardType(.numberPad)
                            }
                            .onTapGesture {
                                endEditing()
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    viewState = .cantieri
                }, label: {
                    if viewState != .cantieri {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.accentColor)
                    }
                })
                
                Spacer()
                
                Button(action: {
                    for c in capoSelezionato{
                        if c.oreLavorate != "" {
                            postUser = capoSelezionato
                            if operaiSelezionati != [] {
                                for o in operaiSelezionati{
                                    if o.oreLavorate != "" {
                                        postOperai = operaiSelezionati
                                        print(capoSelezionato)
                                        print(operaiSelezionati)
                                        viewState = .mezzi
                                    } else {
                                        showingAlertNoOre = true
                                    }
                                }
                            } else {
                                showingAlertNoOperai = true
                            }
                        } else {
                            showingAlertNoOre = true
                        }
                    }
                }, label: {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.accentColor)
                })
                //Alerts
                .alert("Non ci sono operai selezionati", isPresented: $showingAlertNoOperai) {
                    Button("OK", role: .cancel) {
                        showingAlertNoOperai = false
                    }
                }
                .alert("Ci sono operai con 0 ore", isPresented: $showingAlertNoOre) {
                    Button("OK", role: .cancel) {
                        showingAlertNoOre = false
                    }
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct OperaiView_Previews: PreviewProvider {
    static var previews: some View {
        OperaiView(viewState: .constant(ViewState .operai))
    }
}

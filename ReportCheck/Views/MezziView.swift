//
//  MezziView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 10/04/23.
//

import SwiftUI

struct MezziView: View {
    //Variabili di navigazione
    @Binding var viewState: ViewState
    
    //Variabile dei mezzi
    @State var mezzi: [Mezzi] = [Mezzi]()
    @State var selectedMezzo: Set<Int> = []
    @State var mezziSelezionati: [Mezzi] = [Mezzi]()
    
    //Variabili alert
    @State var alertNoMezzi = false
    
    var body: some View {
        VStack{
            HStack {
                Text("Mezzi")
                    .padding(.leading)
                    .padding(.leading)
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                Spacer()
            }
            List {
                ForEach(mezzi) { mezzo in
                    HStack{
                        Text(mezzo.targa)
                        Spacer()
                        CheckBoxView(isChecked: self.selectedMezzo.contains(mezzo.id),
                                     label: "") {
                            if self.selectedMezzo.contains(mezzo.id) {
                                if let index = mezziSelezionati.firstIndex(of: mezzo) {
                                    mezziSelezionati.remove(at: index)
                                }
                                self.selectedMezzo.remove(mezzo.id)
                            } else {
                                mezziSelezionati.append(mezzo)
                                self.selectedMezzo.insert(mezzo.id)
                            }
                        }
                    }
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    viewState = .operai
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
                    if mezziSelezionati != [] {
                        postMezzi = mezziSelezionati
                        viewState = .lavorazioni
                    } else {
                        alertNoMezzi = true
                    }
                }, label: {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.accentColor)
                })
                //Alerts
                .alert(isPresented: $alertNoMezzi) {
                    Alert(
                        title: Text("Non sono stati selezionati mezzi"),
                        message: Text("Sicuro di voler procedere comunque?"),
                        primaryButton: .destructive(Text("Si")) {
                            postMezzi = mezziSelezionati
                            viewState = .lavorazioni
                        },
                        secondaryButton: .cancel(Text("No")) {
                            alertNoMezzi = false
                        }
                    )
                }
                Spacer()
            }
            .padding(.bottom)
        }.onAppear{
            fetchMezzi()
        }
        .scrollContentBackground(.hidden)
    }
}

struct MezziView_Previews: PreviewProvider {
    static var previews: some View {
        MezziView(viewState: .constant(ViewState .mezzi))
    }
}

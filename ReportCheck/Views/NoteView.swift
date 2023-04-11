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
    
    //Variabile alerts
    @State private var showingAlertNoNota = false
    
    //Variabili note
    @State var nota: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading) {
                Text("Nota")
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                    .padding(.horizontal)
                    .padding(.horizontal)
                
                TextField("", text: $nota)
                    .frame(height: 55)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .padding([.horizontal], 24)
            }
            
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    viewState = .lavorazioni
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
                    if nota != "" {
                        postNote = nota
                        let report = Reports(data: postDate, cantiere: postCantiere, operai: postOperai, mezzi: postMezzi ?? [Mezzi](), lavorazioni: postLavorazioni ?? [Lavorazioni](), nota: postNote ?? "", user: postUser)
                        print(report)
                    } else {
                        showingAlertNoNota = true
                    }
                }, label: {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.accentColor)
                })
                //Alerts
                .alert(isPresented: $showingAlertNoNota) {
                    Alert(
                        title: Text("Non ci sono note"),
                        message: Text("Sicuro di voler procedere comunque?"),
                        primaryButton: .destructive(Text("Si")) {
                            postNote = nota
                            let report = Reports(data: postDate, cantiere: postCantiere, operai: postOperai, mezzi: postMezzi ?? [Mezzi](), lavorazioni: postLavorazioni ?? [Lavorazioni](), nota: postNote ?? "", user: postUser)
                            print(report)
                        },
                        secondaryButton: .cancel(Text("No")) {
                            showingAlertNoNota = false
                        }
                    )
                }
                Spacer()
            }.padding(.bottom)
        }
        
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(viewState: .constant(ViewState .note))
    }
}

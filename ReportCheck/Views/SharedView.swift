//
//  SharedView.swift
//  ReportCheck
//
//  Created by Danilo [Sequino] on 11/04/23.
//

import SwiftUI

struct SharedView: View {
    let operai = [
        Operai(id: 1, nome: "1", cognome: "", cNomeCompleto: "Marco Rossi"),
        Operai(id: 1, nome: "3", cognome: "", cNomeCompleto: "Michele Verdi"),
        Operai(id: 1, nome: "4", cognome: "", cNomeCompleto: "Giuseppe Bianchi")
    ]
    let user = [
        Users(id: 1, username: "", password: "", nome: "1", cognome: "", cNomeCompleto: "Grande Capo")
    ]
    
    var body: some View {
        VStack{
            
            //Logo, Luogo e Data
            HStack{
                Image("Logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.top)
                    .padding(.leading)
                Spacer()
                VStack {
                    //Text(postCantiere)
                    Text("Italia-Fortezza-Sottopassi")
                        .font(Font.system(size: 20))
                        .fontWeight(.black)
                    
                    //Text(postDate)
                    Text("11-04-2023")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                }
                .padding(.top)
                Spacer()
            }
            
            Spacer()
            
            //Personale e Mezzi
            HStack{
                Spacer()
                
                VStack{
                    Text("Personale")
                        .fontWeight(.black)
                }
                Spacer()
                
                VStack{
                    Text("Mezzi")
                        .fontWeight(.black)
                }
                Spacer()
            }
            
            //Nominativo e Ore
            HStack{
                VStack {
                    Text("Nominativo")
                        .fontWeight(.bold)
                    ForEach(user.indices) { index in
                        Text(user[index].cNomeCompleto)
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 8)
                    ForEach(operai.indices) { index in
                        Text(operai[index].cNomeCompleto)
                    }
                }
                
                VStack {
                    Text("Ore")
                        .fontWeight(.bold)
                    ForEach(user.indices) { index in
                        Text(user[index].nome)
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 8)
                    ForEach(operai.indices) { index in
                        Text(operai[index].nome)
                    }
                }
                Spacer()
            }
            .padding(.leading)
            .padding(.top)
            Spacer()
            Spacer()
        }
    }
}

struct SharedView_Previews: PreviewProvider {
    static var previews: some View {
        SharedView()
    }
}

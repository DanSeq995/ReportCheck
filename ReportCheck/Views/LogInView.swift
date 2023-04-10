//
//  LogInView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import SwiftUI

struct LogInView: View {
    //Variabili di navigazione
    @Binding var viewState: ViewState
    
    //Variabili per il logIn
    @State var username = ""
    @State var password = ""
    
    //Variabili per alert
    @State var alertWrongCredentials = false
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .size(width: 200, height: 100)
                    .opacity(0.0)

                VStack{
                    //Logo
                    Image("Logo")
                        .resizable()
                        .frame(width: 175, height: 175)
                    
                    //Testo di logIn
                    Text("Login")
                        .font(Font.system(size: 50))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.accentColor)
                    Text("Inserisci le credenziali")
                        .font(Font.system(size: 25))
                        .fontWeight(.regular)
                }
            }
            .onTapGesture {
                endEditing()
            }
            //Username form
            HStack {
                Image(systemName: "person")
                TextField("Nome utente", text: $username)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: .init(lineWidth: 2))
                    .foregroundColor(Color.black)
            )
            .padding(.horizontal)
            
            //Password form
            HStack {
                Image(systemName: "lock")
                TextField("Password", text: $password)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: .init(lineWidth: 2))
            )
            .padding(.horizontal)
            .padding(.bottom)
            
            //LogIn Button
            Button {
                Task{
                    logIn(username:username, password:password)
                }
            } label: {
                Text("Log In")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            
            .background(Color.accentColor)
            .cornerRadius(25)
            .padding(.horizontal)
            .alert("Credenziali sbagliate", isPresented: $alertWrongCredentials) {
                Button("OK", role: .cancel) {
                    alertWrongCredentials = false
                }
            }
            .padding(.bottom)
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(viewState: .constant(ViewState .logIn))
    }
}

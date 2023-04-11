//
//  Constants.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import Foundation
import SwiftUI
//Enum per gestire la navigazione
enum ViewState {
    case logIn
    case cantieri
    case operai
    case mezzi
    case lavorazioni
    case note
    case report
}

//Variabili per fillare il report
public var postUser: [Users] = [Users]()
public var postDate: String!
public var postCantiere: String!
public var postOperai: [Operai]!
public var postMezzi: [Mezzi]?
public var postLavorazioni: [Lavorazioni]?
public var postNote: String?

//Report da mandare a database
public var postReport: Reports!

public func endEditing(){
    UIApplication.shared.endEditing()
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

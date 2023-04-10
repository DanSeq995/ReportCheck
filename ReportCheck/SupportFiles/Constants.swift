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
}

//Variabili da mandare a database
public var postDate: String!
public var postCantiere: String!
public var postOperai: [Operai]!

public func endEditing(){
    UIApplication.shared.endEditing()
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
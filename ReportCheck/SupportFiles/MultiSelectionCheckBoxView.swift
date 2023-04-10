//
//  MultiSelectionCheckBoxView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 10/04/23.
//

import SwiftUI

struct CheckBoxView: View{
    var isChecked: Bool
    var label: String
    var callback: () -> Void
    
    var body: some View{
        Button(action:{
            self.callback()
        }) {
            HStack{
                Image(systemName: isChecked ? "checkmark.square.fill": "square")
                Text(label)
            }
        }
        
    }
}

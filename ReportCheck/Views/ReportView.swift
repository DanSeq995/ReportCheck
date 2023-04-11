//
//  ReportView.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 11/04/23.
//

import SwiftUI

@MainActor
struct ReportView: View {
    //Variabili di navigazione
    @Binding var viewState: ViewState
    
    //Variabili dei report
    @State var report: Dictionary<String, String>!
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            ShareLink("Share", item: createURL())
        }
        .onAppear{
            createReport()
            sendReport(report: report!)
        }
    }
    
    private func createURL() -> URL{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let id = UUID()
     
        let renderedUrl = documentDirectory!.appending(path: "report_\(id).pdf")
     
        if let consumer = CGDataConsumer(url: renderedUrl as CFURL),
           let pdfContext = CGContext(consumer: consumer, mediaBox: nil, nil) {
     
            let renderer = ImageRenderer(content: SharedView())
            renderer.render { size, renderer in
                let options: [CFString: Any] = [
                    kCGPDFContextMediaBox: CGRect(origin: .zero, size: size)
                ]
     
                pdfContext.beginPDFPage(options as CFDictionary)
     
                renderer(pdfContext)
                pdfContext.endPDFPage()
                pdfContext.closePDF()
            }
        }
     
        print("Saving PDF to \(renderedUrl.path())")
        return renderedUrl
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(viewState: .constant(ViewState.report))
    }
}

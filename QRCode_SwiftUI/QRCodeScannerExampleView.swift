//
//  QRCodeScannerExampleView.swift
//  QRCode_SwiftUI
//
//  Created by SeongMinK on 2021/11/29.
//

import SwiftUI

struct QRCodeScannerExampleView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String?

    var body: some View {
        ZStack {
            if self.scannedCode != nil {
                Text("self.scannedCode: \(self.scannedCode!)")
                WebView(urlToLoad: self.scannedCode!)
            } else {
                WebView(urlToLoad: "https://www.naver.com")
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    self.isPresentingScanner = true
                }){
                    Text("Scan QRCode")
                        .font(.system(size: 20))
                        .bold()
                        .padding()
                        .foregroundColor(Color.green)
                        .background(Color.white)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 5)
                                .foregroundColor(Color.green)
                        )
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                Spacer().frame(height: 30)
            }

        }
    }

    var scannerSheet : some View {
        ZStack {
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresentingScanner = false
                    }
                }
            )
            QRCodeGuideLineView()
        }
    }
}

struct QRCodeScannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}

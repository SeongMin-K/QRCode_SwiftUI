//
//  QRCodeGuideLineView.swift
//  QRCode_SwiftUI
//
//  Created by SeongMinK on 2021/11/29.
//

import SwiftUI

struct QRCodeGuideLineView: View {
    var body: some View {
        GeometryReader{ proxy in
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 6, dash: [12]))
                .frame(width: proxy.size.width / 2, height: proxy.size.height / 4)
                .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
                .foregroundColor(Color.green)
        }
    }
}

struct QRCodeGuideLIneView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGuideLineView()
    }
}

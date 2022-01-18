//
//  GeometryReader.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 16.01.2022.
//

import SwiftUI

struct GeometryReaderTest: View {
    var body: some View {
        GeometryReader { geo in
            Image("example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct GeometryReaderTest_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderTest()
    }
}

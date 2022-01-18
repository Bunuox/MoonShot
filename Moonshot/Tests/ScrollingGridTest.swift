//
//  ScrollingGridTest.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 16.01.2022.
//

import SwiftUI

struct ScrollingGridTest: View {
    let layout = [
    GridItem(.fixed(80)),
    GridItem(.fixed(80)),
    GridItem(.fixed(80))
    ]
    
    let layout2 = [
        GridItem(.adaptive(minimum: 80, maximum: 100))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout2) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ScrollingGridTest_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingGridTest()
    }
}

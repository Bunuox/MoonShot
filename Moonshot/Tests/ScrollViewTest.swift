//
//  ScrollViewTest.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 16.01.2022.
//

import SwiftUI

struct CustomText: View{
    let text: String
    var body: some View{
        Text(text)
    }
    
    init(_ text: String) {
        print("craeting a new CustomText")
        self.text = text
    }
}


struct ScrollViewTest: View {
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollViewTest_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewTest()
    }
}

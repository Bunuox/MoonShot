//
//  NavigationLinkTest.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 16.01.2022.
//

import SwiftUI

struct NavigationLinkTest: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("Hello")) {
                Text("Detail")
            }
            Text("Hello, world!")
                .padding()
                .navigationTitle("SwiftUI")
        }
    }
}

struct NavigationLinkTest_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkTest()
    }
}

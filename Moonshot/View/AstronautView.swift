//
//  AstronautView.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 18.01.2022.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .center) {
                    Image(astronaut.id)
                        .resizable()
                        .frame(width: geo.size.width * 0.92, height: geo.size.height * 0.4)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .strokeBorder(lineWidth: 2)
                                .colorInvert()
                                
                        )
                        .padding()
                    
                    Text(astronaut.name)
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding()
                    
                    Divider()
                        Text(astronaut.description)
                            .foregroundColor(.white)
                            .padding()
                }
            }
            .padding(.top, 50)
            .background(Color.darkBackground)
            .ignoresSafeArea()
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["grissom"] ?? Astronaut(id: "N/A", name: "N/A", description: "N/A"))
    }
}

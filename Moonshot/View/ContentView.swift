//
//  ContentView.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 16.01.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var  isGridShowing = true
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    var body: some View {
        NavigationView {
            if isGridShowing {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:100, height: 100)
                                        .padding()
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text(mission.launchDateString)
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.lightBackground)
                                    
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                )
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
                .padding(.top, 150.0)
                .navigationTitle("Moonshot")
                .preferredColorScheme(.dark)
                .background(Color.darkBackground)
                .ignoresSafeArea()
                .toolbar {
                    Button {
                        withAnimation{
                            isGridShowing.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "togglepower")
                            .foregroundColor(.white)
                    }
                    
                }
            }
            
            else {
                List {
                    ForEach(missions) { mission in
                        NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text(mission.displayName)
                                
                                Spacer()
                                
                                Text(mission.launchDateString)
                            }
                        }
                    }
                }
                .toolbar {
                    Button {
                        withAnimation{
                            isGridShowing.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "togglepower")
                            .foregroundColor(.darkBackground)
                    }
                    
                }
                .foregroundColor(.darkBackground)
                .background(Color.darkBackground)
            }
            //.navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12")
        }
    }
}

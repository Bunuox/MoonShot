//
//  MissonView.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 18.01.2022.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.launchDateString)
                }
                
                Divider()
                    .padding([.top, .bottom, .trailing], 6.0)
                    .foregroundColor(Color.white)
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
                
                Divider()
                Text("Crew")
                    .font(.title2.bold())
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id:\.role) { crewMember in
                            NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 114, height: 78)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .strokeBorder(.white, lineWidth: 1)
                                        )
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        
                                        Text(crewMember.role)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .padding(.top, 60)
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.darkBackground)
        .edgesIgnoringSafeArea(.top)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Mission \(member.name) missing.")
            }
        }
    }
}

struct MissonView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronatus: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronatus)
            .preferredColorScheme(.dark)
    }
}


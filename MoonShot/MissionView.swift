//
//  MissionView.swift
//  MoonShot
//
//  Created by A.f. Adib on 11/11/23.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role : String
        let astronaut : Astronaut
    }
    
    let mission : Mission
    let crew : [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                VStack(alignment : .leading){
                    
                    Rectangle()
                        .frame(height : 2)
                        .foregroundColor(.lightBg)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom)
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height : 2)
                        .foregroundColor(.lightBg)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 1)
                    
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(crew, id : \.role) { crewMem in
                            NavigationLink {
                                AstroView(astro: crewMem.astronaut)
                            } label: {
                                HStack{
                                    Image (crewMem.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(Capsule())
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white,lineWidth: 1)
                                        )
                                    
                                    VStack(alignment : .leading) {
                                        Text(crewMem.astronaut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        
                                        Text(crewMem.role)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .background(.darkBg)
    }
    
    init(mission : Mission, astronauts : [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let missions : [Mission] = Bundle.main.decode("missions.json")
        let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
        
        return MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

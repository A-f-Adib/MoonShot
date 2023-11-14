//
//  ContentView.swift
//  MoonShot
//
//  Created by A.f. Adib on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State var listView : Bool = false
    
    var body: some View {
       
        NavigationView{
            
            if listView == false {
                
                
                
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink {
                               MissionView(mission: mission, astronauts: astronauts)
                            } label : {
                                VStack{
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    VStack{
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text(mission.launchDate ?? "Error")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth : .infinity)
                                    .background(.lightBg)
                                }
                                .overlay(
                                  RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBg)
                                )
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
                .navigationTitle("MoonShot")
                .background(.darkBg)
                .preferredColorScheme(.dark)
                .toolbar(content: {
                    Button {
                        
                        listView.toggle()
                        
                    } label: {
                        Image(systemName: "list.bullet.circle")
                            .font(.title)
                    }

                })
                
            } else {
                
                
                    List{
    //                    LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink {
                                   MissionView(mission: mission, astronauts: astronauts)
                                } label : {
                                    VStack{
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding()
                                        
                                        VStack{
                                            Text(mission.displayName)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Text(mission.launchDate ?? "Error")
                                                .font(.callout)
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth : .infinity)
                                        .background(.lightBg)
                                    }
                                    .frame(height: 200)
                                    .overlay(
                                      RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBg)
                                    )
                                    .background(.darkBg)
                                   
                                }
                            }
    //                    }
                        .padding([.horizontal, .bottom])
                    }
                    .navigationTitle("MoonShot")
                    .background(.darkBg)
                    .preferredColorScheme(.dark)
                    .toolbar(content: {
                        Button {
                            
                            listView.toggle()
                            
                        } label: {
                            Image(systemName: "list.bullet.circle")
                                .font(.title)
                        }

                })
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}

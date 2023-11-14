//
//  AstroView.swift
//  MoonShot
//
//  Created by A.f. Adib on 11/14/23.
//

import SwiftUI

struct AstroView: View {
    
    let astro : Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astro.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astro.description)
                    .padding()
            }
        }
        .background(.darkBg)
        .navigationTitle(astro.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstroView_Previews: PreviewProvider {
    static var previews: some View {
        let astros : [String : Astronaut] = Bundle.main.decode("astronauts.json")
        
        return AstroView( astro: astros["aldrin"]!)
            .preferredColorScheme(.dark)
    }
}

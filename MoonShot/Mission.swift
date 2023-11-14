//
//  Mission.swift
//  MoonShot
//
//  Created by A.f. Adib on 11/11/23.
//

import Foundation

struct Mission : Codable, Identifiable {
    
    struct CrewRole : Codable {
        let name : String
        let role : String
    }
    
    
    let id : Int
    let launchDate : String?
    let crew : [CrewRole]
    let description : String
    
    var displayName : String {
        "Apollo \(id)"
    }
    
    var image : String {
        "apollo\(id)"
    }
    
//    var formattedDate : String {
//        launchDate?.formatted(date: .abbreviated, time: .omitted)
//    }
}

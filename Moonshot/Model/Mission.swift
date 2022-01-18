//
//  Mission.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 17.01.2022.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String
    
    struct Crew: Codable{
        let name: String
        let role: String
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var launchDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        if let launch = launchDate{
            return formatter.string(from: launch)
        }
        
        return "N/A"
    }
}

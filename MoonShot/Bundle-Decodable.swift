//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by A.f. Adib on 11/11/23.
//

import Foundation

extension Bundle {
    
    func decode<T:Codable> (_ file : String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load")
        }
        
        let decoder = JSONDecoder()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "y-MM-dd"
//        decoder.dataDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode")
        }
        
        return loaded
    }
}

//
//  DataLoader.swift
//  Quaker
//
//  Created by Dennis Parussini on 08.11.25.
//

import Foundation
import SwiftData

actor DataLoader {
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func load<T>() async throws -> T where T: Decodable {
        let data = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data.0)
    }
}

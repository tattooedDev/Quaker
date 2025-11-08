//
//  FeatureStore.swift
//  Quaker
//
//  Created by Dennis Parussini on 08.11.25.
//

import Foundation
import SwiftData

@MainActor
@Observable
final class FeatureStore {
    private let loader: DataLoader
    
    init() {
        self.loader = DataLoader(url: URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson")!)
    }
    
    func fetchFeatures(modelContainer: ModelContainer) async throws {
        let collection: FeatureCollection = try await loader.load()
        
        let db = FeatureDB(modelContainer: modelContainer)
        
        try await db.saveFeatures(collection.features.map(\.properties))
    }
}

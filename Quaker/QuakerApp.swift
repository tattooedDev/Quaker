//
//  QuakerApp.swift
//  Quaker
//
//  Created by Dennis Parussini on 08.11.25.
//

import SwiftUI
import SwiftData

@main
struct QuakerApp: App {
    var sharedModelContainer: ModelContainer {
        let schema = Schema([
            Feature.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    @State private var store = FeatureStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task(priority: .background) {
                    do {
                        try await fetch()
                    } catch {
                        print(error)
                    }
                }
        }
        .modelContainer(sharedModelContainer)
    }
    
    func fetch() async throws {
         await withThrowingTaskGroup(of: Void.self) { group in
            group.addTask {
                try await store.fetchFeatures(modelContainer: sharedModelContainer)
            }
        }
    }
}

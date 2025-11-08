//
//  ContentView.swift
//  Quaker
//
//  Created by Dennis Parussini on 08.11.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var features: [Feature]
    
    var body: some View {
        NavigationStack {
            List(features) { feature in
                Text(feature.code)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        do {
                            features.forEach { feature in
                                modelContext.delete(feature)
                            }
                            
                            try modelContext.save()
                        } catch {
                            print(error)
                        }
                    } label: {
                        Text("Nuke DB")
                    }
                }
            }
        }
    }
}

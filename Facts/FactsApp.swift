//
//  FactsApp.swift
//  Facts
//
//  Created by Pallavi on 02.01.24.
//

import SwiftUI
import SwiftData

@main
struct FactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
        .modelContainer(for: Person.self)
    }
}

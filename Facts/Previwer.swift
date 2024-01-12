//
//  Previwer.swift
//  Facts
//
//  Created by Pallavi on 12.01.24.
//

import Foundation
import SwiftData

@MainActor
struct Previwer {
    let peron:  Person
    let event: Event
    let modelContainer:  ModelContainer
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        modelContainer = try ModelContainer(for: Person.self, configurations: config)
        
        event = Event(name: "Java event", location: "Berlin")
        peron = Person(name: "Jon", details: "developer", emailID: "jon@gmail.com", metAt: event)
      
        modelContainer.mainContext.insert(peron)
    }
}

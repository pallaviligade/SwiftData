//
//  Person.swift
//  Facts
//
//  Created by Pallavi on 03.01.24.
//

import Foundation
import SwiftData

@Model
class Person
{
    var name: String
    var details: String
    var emailID: String
    var event: Event?
    
    init(name: String, details: String, emailID: String, event: Event? = nil) {
        self.name = name
        self.details = details
        self.emailID = emailID
        self.event = event
    }
}

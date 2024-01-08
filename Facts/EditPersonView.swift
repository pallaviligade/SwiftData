//
//  EditPerson.swift
//  Facts
//
//  Created by Pallavi on 04.01.24.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
   @Bindable var person: Person
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                
                TextField("Email Address", text: $person.emailID)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            section("Where did you meet")
            Section("Notes") {
                TextField("Deatils about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle($person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditPerson()
//}

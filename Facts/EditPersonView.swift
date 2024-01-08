//
//  EditPerson.swift
//  Facts
//
//  Created by Pallavi on 04.01.24.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    @Environment(\.modelContext) var modelContext
   @Bindable var person: Person
    @Query(sort:[
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
    ]) var events: [Event]
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                
                TextField("Email Address", text: $person.emailID)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Section("Where did you meet") {
                Picker("Met At", selection: $person.metAt) {
                    Text("Unknow event")
                    if events.isEmpty == false{
                        Divider()
                    
                        ForEach(events) { event in
                            Text(event.name)
                        }
                    }
                    
                }
                Button("Add Event", action: addEvent)
            }
            Section("Notes") {
                TextField("Deatils about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle($person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addEvent() {
       let evet = Event(name: "", location: "")
        modelContext.insert(evet)
    }
}

//#Preview {
//    EditPersonView()
//}

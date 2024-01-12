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
  
    @Query(sort:[
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
    ]) var events: [Event]
    
    @Bindable var person: Person
    @Binding var navigationPath: NavigationPath
    
    
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
                        .tag(Optional<Event>.none)
                    if events.isEmpty == false{
                        Divider()
                    
                        ForEach(events) { event in
                            Text(event.name)
                                .tag(Optional(event))
                        }
                    }
                    
                }
                Button("Add a new Event", action: addEvent)
            }
            Section("Notes") {
                TextField("Deatils about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle($person.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Event.self) { event in
            EditEventView(event: event)
        }
    }
    
    func addEvent() {
       let evet = Event(name: "", location: "")
        modelContext.insert(evet)
        navigationPath.append(evet)
    }
}

//#Preview {
//    EditPersonView()
//}

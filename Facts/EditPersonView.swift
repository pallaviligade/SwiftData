//
//  EditPerson.swift
//  Facts
//
//  Created by Pallavi on 04.01.24.
//

import PhotosUI
import SwiftUI
import SwiftData

struct EditPersonView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var person: Person
    @Binding var navigationPath: NavigationPath
    @State private var selectedphotoItem: PhotosPickerItem?
    
    @Query(sort:[
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
    ]) var events: [Event]
    
    var body: some View {
        Form {
            Section{
                if let imageData = person.photo, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage).resizable().scaledToFit()
                }
                PhotosPicker(selection: $selectedphotoItem, matching: .images) {
                    Label("Select a photo", systemImage: "person")
                }
            
                
            }
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
        .onChange(of: selectedphotoItem, loadPhoto)
    }
    
    func addEvent() {
       let evet = Event(name: "", location: "")
        modelContext.insert(evet)
        navigationPath.append(evet)
    }
    
    func loadPhoto() {
        Task { @MainActor in
            person.photo = try await selectedphotoItem?.loadTransferable(type: Data.self)
        }
    }
}

#Preview {
    do{
       let previwer = try Previwer()
        return EditPersonView(person: previwer.peron, navigationPath: .constant(NavigationPath()))
            .modelContainer(previwer.modelContainer)
    }catch {
        return Text("Failed to create previewer \(error.localizedDescription)")
    }
}

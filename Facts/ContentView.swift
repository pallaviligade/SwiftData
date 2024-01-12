//
//  ContentView.swift
//  Facts
//
//  Created by Pallavi on 02.01.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var path = NavigationPath()
  
    @State private var sortOrder =  [SortDescriptor(\Person.name)]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path)
        {
            PeopleView(searchString: searchText, sortOrder: sortOrder)
            .navigationTitle("People List")
            .navigationDestination(for: Person.self) { person in
                Text(person.name)
                EditPersonView(person: person, navigationPath: $path)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name (A-Z)")
                            .tag([SortDescriptor(\Person.name)])
                        Text("Name (Z-A)")
                            .tag([SortDescriptor(\Person.name, order:.reverse)])
                    }
                }
                
                Button("Add Person", systemImage: "plus", action: addPerson)
            }
            .searchable(text: $searchText)
        }
        
    }
    
    func addPerson() {
        let person = Person(name: "", details: "", emailID: "")
        modelContext.insert(person)
        path.append(person)
    }
    
   
}

#Preview {
    do{
     let previewer = try Previwer()
        return ContentView().modelContainer(previewer.modelContainer)
    }catch {
        return Text("Failed to load previwer:\(error.localizedDescription)")
    }
}

//
//  PeopleView.swift
//  Facts
//
//  Created by Pallavi on 05.01.24.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    @Query var peopel: [Person]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List{
            ForEach(peopel) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: { indexSet in
                deletePerson(at: indexSet)
            })
        }
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Person>] = []) {
        _peopel = Query(filter: #Predicate { person in
            if searchString.isEmpty {
                true
            } else {
                person.name.localizedStandardContains(searchString)
                || person.emailID.localizedStandardContains(searchString)
                || person.details.localizedStandardContains(searchString)
            }
        },  sort: sortOrder)
    }
    
    func deletePerson(at offsets: IndexSet) {
        for offset in offsets {
            let person = peopel[offset]
            modelContext.delete(person)
        }
    }
}

#Preview {
    PeopleView()
}

//
//  PersonEvent.swift
//  Facts
//
//  Created by Pallavi on 05.01.24.
//

import SwiftUI

struct EditEventView: View {
    @Binding var event: Event
    
    var body: some View {
        Form{
                TextField("Name of Event", text: $event.name)
                    .textContentType(.name)
                TextField("Email Address", text: $event.location)
                    .textContentType(.location)
                    .textInputAutocapitalization(.never)
            }
            
        .navigationTitle("Edit Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditEventView()
//}

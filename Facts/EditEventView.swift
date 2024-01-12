//
//  PersonEvent.swift
//  Facts
//
//  Created by Pallavi on 05.01.24.
//

import SwiftUI

struct EditEventView: View {
    @Bindable var event: Event
    
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

#Preview {
    do{
        let previwer = try Previwer()
        return EditEventView(event: previwer.event)
            .modelContainer(previwer.modelContainer)
    }catch {
        return Text("Failed to previwers:\(error.localizedDescription)")
    }
}

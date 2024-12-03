//
//  EventsView.swift
//  Event Countdown
//
//  Created by Lyn Scott on 11/26/24.
//

import SwiftUI

struct EventsView: View {
    @State private var events: [Event] = [
        Event(id: UUID(), title: "Salsa Class 💃", date: Date(), textColor: .red),
        Event(id: UUID(), title: "Date Night 💕", date: Date().addingTimeInterval(86400), textColor: .purple),
    ]
    @State private var selectedEvent: Event? = nil
    @State private var creatingNewEvent = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(events) { event in
                    Button {
                        selectedEvent = event
                    } label: {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: deleteEvent)
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        creatingNewEvent = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: $creatingNewEvent) {
                EventForm { newEvent in
                    events.append(newEvent)
                    creatingNewEvent = false
                }
            }
            .navigationDestination(item: $selectedEvent) { event in
                EventForm(event: event) { updatedEvent in
                    if let index = events.firstIndex(where: { $0.id == updatedEvent.id }) {
                        events[index] = updatedEvent
                    }
                    selectedEvent = nil
                }
            }
        }
    }

    private func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
}


struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}

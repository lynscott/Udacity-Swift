//
//  EventForm.swift
//  Event Countdown
//
//  Created by Lyn Scott on 11/26/24.
//

import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var textColor: Color = .blue
    @State private var isNewEvent: Bool = true

    var onSave: (Event) -> Void
    
    init(event: Event? = nil, onSave: @escaping (Event) -> Void) {
            self._title = State(initialValue: event?.title ?? "")
            self._date = State(initialValue: event?.date ?? Date())
            self._textColor = State(initialValue: event?.textColor ?? .blue)
            self.onSave = onSave
            if event != nil {
                self._isNewEvent = State(initialValue:false)
            }
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                ColorPicker("Text Color", selection: $textColor)
            }
            .navigationTitle( isNewEvent ? "New Event" : "Edit Event")
            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button("Cancel") {
//                        dismiss()
//                    }
//                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newEvent = Event(id: UUID(), title: title, date: date, textColor: textColor)
                        onSave(newEvent)
                        dismiss()
                    }
                }
            }
        }
    }
}

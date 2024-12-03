//
//  EventRow.swift
//  Event Countdown
//
//  Created by Lyn Scott on 11/26/24.
//
import SwiftUI

struct EventRow: View {
    let event: Event;
    
    @State private var currentDate = Date()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var formatter: RelativeDateTimeFormatter {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            return formatter
    }


    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                    .foregroundColor(event.textColor)
                    
                Text(formatter.localizedString(for: event.date, relativeTo: Date.now) )
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 6)
        .onReceive(timer) { newDate in
            currentDate = newDate
        }
    }
}

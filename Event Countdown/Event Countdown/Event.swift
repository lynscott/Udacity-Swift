//
//  Event.swift
//  Event Countdown
//
//  Created by Lyn Scott on 11/26/24.
//
import Foundation
import SwiftUI

struct Event: Identifiable, Hashable {
    let id: UUID
    var title: String
    var date: Date
    var textColor: Color
}

extension Event: Comparable {
    static func < (lhs: Event, rhs: Event) -> Bool {
       return lhs.date < rhs.date
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.date == rhs.date
    }
}

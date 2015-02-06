//
//  Event.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/28/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import Foundation

struct Event {
    let id: Int
    let startDate: NSDate
    let status: String
}

extension Event {
    static func fromCourse(course: Course) -> [Event] {
        return [
            Event(id: 1, startDate: NSDate(iso8601: "2015-01-15T17:38:19.000-02:00"), status: "empty"),
            Event(id: 2, startDate: NSDate(iso8601: "2015-01-16T17:38:19.000-02:00"), status: "empty"),
        ]
    }
}
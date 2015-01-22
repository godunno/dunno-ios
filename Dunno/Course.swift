//
//  Course.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/15/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import Foundation

struct Course {
    let id: Int
    let startDate: NSDate
    let endDate: NSDate
    let name: String
    let institution: String?
    let class_name: String?
    let color: String?
}

extension Course {
    static func mockups() -> [Course] {
        var startDate = NSDate(dateString: "2014-03-01")
        var endDate = NSDate(dateString: "2014-06-30")
       return [
        Course(id: 1, startDate: startDate, endDate: endDate, name: "Fundamentos da Psicologia I", institution: "PUC", class_name: "TR203", color: "#FEDD59"),
        Course(id: 1, startDate: startDate, endDate: endDate, name: "Introdução à Psicologia", institution: "PUC", class_name: "TR204", color: "#54C5FF")
        ]
    }
}
extension NSDate
{
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:d!)
    }
}
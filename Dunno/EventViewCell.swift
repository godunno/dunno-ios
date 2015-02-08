//
//  EventViewCell.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/28/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import UIKit

@IBDesignable
class EventViewCell: UICollectionViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var classNumber: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var event: Event!
    
    func loadEvent(event: Event) {
        self.event = event
        loadDate()
    }
    
    func loadDate() {
        dayLabel.text = String(event.startDate.dayOfMonth())
        monthLabel.text = event.startDate.threeLetterMonth()
        timeLabel.text = event.startDate.weekdayAndTime()
    }
}

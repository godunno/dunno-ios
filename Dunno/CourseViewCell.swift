//
//  CourseViewCell.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/16/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import UIKit

class CourseViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var institutionLabel: UILabel!
    @IBOutlet weak var topPanel: UIView!
    
    var course: Course?
    
    func loadCourse(course: Course) {
        self.course = course
        nameLabel.text = course.name
        roomLabel.text = course.class_name
        institutionLabel.text = course.institution
    }
}

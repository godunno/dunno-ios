//
//  CoursesViewController.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/15/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import UIKit

class CoursesViewController: UICollectionViewController, UICollectionViewDataSource {
    let courses = Course.mockups()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println(courses.count)
        return courses.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("courseCell", forIndexPath: indexPath) as CourseViewCell
        let course = courseForIndexPath(indexPath)
        
        cell.layer.cornerRadius = 5.0
        cell.nameLabel.text = course.name
        cell.roomLabel.text = course.class_name
        cell.institutionLabel.text = course.institution
        cell.topPanel!.backgroundColor = UIColor(rgba: course.color!)
        
        return cell
    }
    
    func courseForIndexPath(indexPath: NSIndexPath) -> Course {
       return courses[indexPath.row]
    }
}
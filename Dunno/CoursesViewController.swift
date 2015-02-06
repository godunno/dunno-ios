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
        return courses.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("courseCell", forIndexPath: indexPath) as CourseViewCell
        let course = courseForIndexPath(indexPath)
        
        cell.loadCourse(course)
        
        cell.topPanel!.backgroundColor = UIColor(rgba: course.color!)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as? CourseViewCell
        let destinationViewController = segue.destinationViewController as? EventViewController
        
        if (cell != nil) && (destinationViewController != nil) {
            destinationViewController?.loadCourse(cell!.course!)
        }
    }
    
    func courseForIndexPath(indexPath: NSIndexPath) -> Course {
       return courses[indexPath.row]
    }
}
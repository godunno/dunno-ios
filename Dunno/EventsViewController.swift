//
//  EventViewController.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/28/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import UIKit

class EventsViewController: UICollectionViewController {
    var course: Course!
    var events: [Event]!
    
    func loadCourse(course: Course) {
        self.course = course
        self.events = Event.fromCourse(self.course)
        self.navigationItem.title = course.name
    }
    
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if events != nil {
            return events.count
        } else {
            return 0
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("eventCell", forIndexPath: indexPath) as EventViewCell
        let event = eventForIndexPath(indexPath)
        
        cell.classNumber.text = "Aula \(indexPath.row+1)"
        cell.loadEvent(event)
        
        return cell
    }
    
    func eventForIndexPath(indexPath: NSIndexPath) -> Event {
       return events[indexPath.row]
    }
    
}
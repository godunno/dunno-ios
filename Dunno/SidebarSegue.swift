//
//  SidebarSegue.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/6/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import UIKit

class SidebarSegue : UIStoryboardSegue {
    override func perform() {
        let sidebarController = self.sourceViewController as SidebarController
        let destinationController = self.destinationViewController as UIViewController
        
        for view in sidebarController.placeholder.subviews {
           view.removeFromSuperview()
        }
        
        sidebarController.currentViewController = destinationController
        sidebarController.placeholder.addSubview(destinationController.view)
    }
}
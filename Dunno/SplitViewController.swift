//
//  SplitViewController.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/21/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewWillAppear(animated: Bool) {
        self.maximumPrimaryColumnWidth = 120.0
    }
}

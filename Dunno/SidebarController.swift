//
//  SidebarController.swift
//  Dunno
//
//  Created by Pedro Nascimento on 12/12/14.
//  Copyright (c) 2014 Pedro Nascimento. All rights reserved.
//

import UIKit

class SidebarController: ViewController {
    let defaultFont = UIFont(name: "Lato-Regular", size: 13.6)
    
    @IBOutlet weak var currentViewController: UIViewController!
    @IBOutlet weak var placeholder: UIView!
    @IBOutlet weak var coursesButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coursesButton.titleLabel?.font = defaultFont
        logoutButton.titleLabel?.font = defaultFont
    }
}
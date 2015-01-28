//
//  NavigationController.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/28/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        let image = UIImage(named: "Navigation Bar.png")
        self.navigationBar.setBackgroundImage(image, forBarMetrics: .Default)
        let font = UIFont(name: "Lato-Light", size: 18)!
        let dict : NSDictionary = [NSFontAttributeName: font]
        self.navigationBar.titleTextAttributes = dict
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

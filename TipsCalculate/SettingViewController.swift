//
//  SettingViewController.swift
//  TipsCalculate
//
//  Created by Nghi Bui on 11/5/15.
//  Copyright © 2015 nghibui. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    let DEFAULT_PERCENTAGE = "defaultPercent"
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var defaultPercentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaultPercent = defaults.integerForKey(DEFAULT_PERCENTAGE)
        if defaultPercent == 0 {
            defaultPercent = 10
        }
        switch defaultPercent {
        case 10:
            defaultPercentControl.selectedSegmentIndex = 0
        case 15:
            defaultPercentControl.selectedSegmentIndex = 1
        case 20:
            defaultPercentControl.selectedSegmentIndex = 2
        default:
            break
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    @IBAction func onIndexChanged(sender: AnyObject) {
        switch defaultPercentControl.selectedSegmentIndex {
        case 0:
            defaults.setInteger(10, forKey: DEFAULT_PERCENTAGE)
        case 1:
            defaults.setInteger(15, forKey: DEFAULT_PERCENTAGE)
        case 2:
            defaults.setInteger(20, forKey: DEFAULT_PERCENTAGE)
        default:
            break
        }
        defaults.synchronize()
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

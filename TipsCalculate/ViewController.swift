//
//  ViewController.swift
//  TipsCalculate
//
//  Created by Nghi Bui on 11/4/15.
//  Copyright © 2015 nghibui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    let BILL_AMOUNT_KEY = "billed"
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    var percentValue: Float!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let billedAmount = defaults.floatForKey(BILL_AMOUNT_KEY)
        calculateFees(billedAmount)
        amountLabel.becomeFirstResponder()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBillChanged(sender: AnyObject) {
        calculateFees(NSString(string: amountLabel.text!).floatValue)
    }
    
    func roundValue(value: Float) -> Float{
        return roundf(value) * 1;
    }
    
    func calculateFees(amount: Float) {
     
        let tip = (amount * Float(percentSlider.value))/100
        let total = amount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
        amountLabel.text = String(Int(amount))
        NSUserDefaults.standardUserDefaults().setObject(amount, forKey: BILL_AMOUNT_KEY)
    }

    
    @IBAction func onSliderChangedValue(sender: AnyObject)
    {
        let value = roundf(percentSlider.value)
        percentSlider.setValue(value, animated: true)
        
        var newBackgroundColor : UIColor
        
        let sliderValue = CGFloat(percentSlider.value/30)
        // changes the newBackgroundColor variable to new color values.
        newBackgroundColor = UIColor(red: sliderValue, green: sliderValue-0.4, blue: sliderValue+0.7, alpha: sliderValue+0.4)
        
        // changes the background color
        mainView.backgroundColor = newBackgroundColor
        amountLabel.backgroundColor = newBackgroundColor
        
        percentLabel.text = String(Int(value))+"%"
        if(percentSlider.value == 10){
            tipControl.selectedSegmentIndex = 0
        }
        if(percentSlider.value == 15){
            tipControl.selectedSegmentIndex = 1
        }
        if(percentSlider.value == 20){
           tipControl.selectedSegmentIndex = 2
        }
        calculateFees(NSString(string: amountLabel.text!).floatValue)
    }
    
    @IBAction func onSegmentChanged(sender: AnyObject) {
        if(tipControl.selectedSegmentIndex == 0){
            percentSlider.setValue(10, animated: true)
            percentLabel.text = String("10%")
        }
        if(tipControl.selectedSegmentIndex == 1){
            percentSlider.setValue(15, animated: true)
            percentLabel.text = String("15%")
        }
        if(tipControl.selectedSegmentIndex == 2){
            percentSlider.setValue(20, animated: true)
            percentLabel.text = String("20%")
        }
        calculateFees(NSString(string: amountLabel.text!).floatValue)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


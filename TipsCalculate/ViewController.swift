//
//  ViewController.swift
//  TipsCalculate
//
//  Created by Nghi Bui on 11/4/15.
//  Copyright © 2015 nghibui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    var percentValue: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tipLabel.text = "$0.00"
       
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBillChanged(sender: AnyObject) {
        calculateFees()
    }
    func roundValue(value: Float) -> Float{
        return roundf(value) * 1;
    }
    
    func calculateFees() {
        let amount : Float = NSString(string: amountLabel.text!).floatValue
        let tip = (amount * Float(percentSlider.value))/100
        let total = amount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
    }

    
    @IBAction func onSliderChangedValue(sender: AnyObject)
    {
        var value = roundf(percentSlider.value)
        percentSlider.setValue(value, animated: true)
        
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
        calculateFees()
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
        calculateFees()
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


//
//  ViewController.swift
//  Healthy BMI Test
//
//  Created by Daniel kantor on 3/27/15.
//  Copyright (c) 2015 Danco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var someParameter = 1

    @IBOutlet weak var weightTextField: UITextField!

   @IBOutlet weak var heightTextField: UITextField!

    var selectedFeet:Int?
    var selectedInches:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var weightpickerView = UIPickerView()
        weightpickerView.delegate = self
        weightpickerView.dataSource = self
        weightpickerView.tag = 2
        weightTextField.inputView = weightpickerView


        var heightPickerView = UIPickerView()
        heightPickerView.delegate = self
        heightPickerView.dataSource = self
        heightPickerView.tag = 1
        heightTextField.inputView = heightPickerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateBmiPressed(sender: AnyObject) {

        let weight = weightTextField.text.toInt()
        
        if selectedFeet != nil && selectedInches != nil && weight != nil {
            
            let height = (selectedFeet! * 12) + selectedInches!
        
            let floatHeight = Float(height)
            
            let floatWeight = Float(weight!)
            
            let BMI = (floatWeight / (floatHeight * floatHeight)) * 703.0
            
            // Assigning weight classes to use in pop-ups
            
            var underWeightString = "You are underweight"
            
            var normalWeightString = "You have a normal weight"
            
            var overWeightString = "You are overweight"
            
            var obeseWeightString = "You are obese"
            
            // Assigning what pop-up will say
            
            if BMI <= 18.5 {
                let alert = UIAlertView(title: underWeightString, message: "Your BMI is \(BMI.description)", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
            
            if BMI >= 18.5 && BMI <= 24.9 {
                let alert = UIAlertView(title: normalWeightString, message: "Your BMI is \(BMI.description)", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
            
            if BMI >= 25 && BMI <= 29.9 {
                let alert = UIAlertView(title: overWeightString, message: "Your BMI is \(BMI.description)", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
            
            if BMI >= 30 {
                let alert = UIAlertView(title: obeseWeightString, message: "Your BMI is \(BMI.description)", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
            
            }
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        if pickerView.tag == 1 {
            return 2

        } else {
            return 1
        }
    }


    // 0
    // 1
    //...
    // 11

    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView.tag == 1 {
            if component == 0 {
                return 5
            } else {
                return 12
            }

        } else {
            return 231
        }
    }


    // row:0    title: "70"
    // row:1    title: "71"
    // row:2
    // ....
    // row:229  title: "299"
    // row:229  title: "300"

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        if pickerView.tag == 1 {
            if component == 0 {
                return "\(row + 3)'"

            } else {
                return "\(row)\""
            }

        } else {
            return "\(row + 70)"
        }

    }


    

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){

        if pickerView.tag == 1 {

            if component == 0 {
                selectedFeet = row + 3
            }
            else {
                selectedInches = row
            }

            if selectedFeet != nil && selectedInches != nil {
                self.heightTextField.text = "\(selectedFeet!)' \(selectedInches!)\""
            } else {
                self.heightTextField.text = "N/A"
            }

        } else {
            weightTextField.text = "\(row + 70)"
        }

    }
}



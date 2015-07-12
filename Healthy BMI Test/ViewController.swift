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
        let height = heightTextField.text.toInt()

        if weight != nil && height != nil {
            let BMI = (weight! / (height! ^ 2)) * 703

           let alert = UIAlertView(title: "Your BMI is", message: BMI.description, delegate: nil, cancelButtonTitle: "OK")
            alert.show()

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


    var selectedFeetIndex:Int?
    var selectedInchesIndex:Int?

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){

        if pickerView.tag == 1 {

            if component == 0 {
                selectedFeetIndex = row
            }
            else {
                selectedInchesIndex = row
            }

            if selectedFeetIndex != nil && selectedInchesIndex != nil {
                self.heightTextField.text = "\(selectedFeetIndex! + 3)' \(selectedInchesIndex!)\""
            } else {
                self.heightTextField.text = "N/A"
            }

        } else {
            weightTextField.text = "\(row + 70) lbs"
        }

    }
}



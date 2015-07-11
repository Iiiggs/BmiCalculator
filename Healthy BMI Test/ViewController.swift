//
//  ViewController.swift
//  Healthy BMI Test
//
//  Created by Daniel kantor on 3/27/15.
//  Copyright (c) 2015 Danco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var someParameter = 1

    @IBOutlet weak var weightTextField: UITextField!

    @IBOutlet weak var heightTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
}



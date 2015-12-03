//
//  ViewController.swift
//  PopDatePicker-Test
//
//  Created by mitchell hudson on 11/22/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var popDatePicker: PopDatePicker?
    
    
    // MARK: IBOutlets 
    
    // This textField will work with the datepicker.
    @IBOutlet weak var dateText: UITextField!
    
    
    // MARK: TextField Delegate methods
    
    // This method is called when someone taps on the textfield to start entering text.
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if self.dateText === textField {
            resign()
            popDatePicker?.pick(self, initDate: nil, dataChanged: { (newDate: NSDate, forTextField: UITextField) -> () in
                let formatter = NSDateFormatter()
                formatter.dateStyle = .MediumStyle
                forTextField.text = formatter.stringFromDate(newDate)
            })
            return false
        }
        return true
    }
    
    func resign() {
        dateText.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popDatePicker = PopDatePicker(forTextField: dateText)
        // Set the arrow direction to Left, Right, or Down
        // popDatePicker?.arrowDirection = .Down
        dateText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


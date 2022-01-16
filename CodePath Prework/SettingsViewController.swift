//
//  SettingsViewController.swift
//  CodePath Prework
//
//  Created by David Zhu on 1/3/22.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tipPercentage1: UITextField!
    @IBOutlet weak var tipPercentage2: UITextField!
    @IBOutlet weak var tipPercentage3: UITextField!
    
    var changeTips: (([String?]) -> ())?
    
    // dummy function that exists only because changeTips has not been initialized yet.
    func pass(dummy_var: [String?]) {
        
    }
    
    @IBAction func changeTip2(_ sender: UITextField) {
        (changeTips ?? pass)([tipPercentage1.text, tipPercentage2.text, tipPercentage3.text])
    }
    
}

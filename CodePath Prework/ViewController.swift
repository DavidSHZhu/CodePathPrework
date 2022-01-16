//
//  ViewController.swift
//  CodePath Prework
//
//  Created by David Zhu on 12/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tipPercentages = [15.0, 18.0, 20.0]
    
    // UI Elements in the original View Controller
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipOptions: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tip = bill * Double( tipPercentages[tipControl.selectedSegmentIndex]) / 100.0
        let total = tip + bill
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func changeSegmentLabels(percentages: [String?]) {
        if (percentages.count == 3) {
            for (index, percent) in percentages.enumerated() {
                tipOptions.setTitle((percent ?? "0") + "%", forSegmentAt: index)
                tipPercentages[index] = Double(percentages[index] ?? "0") ?? 0
            }
         }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? SettingsViewController {
            dvc.changeTips = changeSegmentLabels
        }
        
    }
}


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
    
    let billDefault = UserDefaults()
    let lastOpenedDate = UserDefaults()
    let defaultTips = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification) in
            self.lastOpenedDate.set(Date(), forKey: "LastOpened")
        }
        
        if lastOpenedDate.value(forKey: "LastOpened") == nil {
            return
        }
        
        let current = Date()
        let date_minutes = minutesBetweenDates(lastOpenedDate.value(forKey: "LastOpened") as! Date, current)
        
        if date_minutes <= 10.0 {
            // Sets the bill amount to the previous bill amount when the app was last launched, if there is such a previous bill amount.
            if let bill = billDefault.value(forKey: "bill") as? String {
                billAmountTextField.text = bill
            }
            
            /*
            if let tips = defaultTips.value(forKey: "tipPercentages") as? [Double] {
                tipPercentages = tips
                let string_tips = tipPercentages.map{ (num: Double) -> String? in
                    if let str = String?(num) ?? "0" {
                        return str
                    }
                    return "0"
                }
                changeSegmentLabels(percentages: string_tips)
            } */
        }
        
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
        
        // Saving the bill value into the default bill value
        billDefault.set(billAmountTextField.text, forKey: "bill")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? SettingsViewController {
            dvc.changeTips = changeSegmentLabels
        }
    }
    
    func changeSegmentLabels(percentages: [String?]) {
        if (percentages.count == 3) {
            for (index, percent) in percentages.enumerated() {
                tipOptions.setTitle((percent ?? "0") + "%", forSegmentAt: index)
                tipPercentages[index] = Double(percentages[index] ?? "0") ?? 0
            }
         }
    }
    
    func minutesBetweenDates(_ oldDate: Date, _ newDate: Date) -> Double{

        //get both times sinces refrenced date and divide by 60 to get minutes
        let newDateMinutes = newDate.timeIntervalSinceReferenceDate/60
        let oldDateMinutes = oldDate.timeIntervalSinceReferenceDate/60

        //then return the difference
        return newDateMinutes - oldDateMinutes
    }
}


//
//  ViewController.swift
//  Tipper
//
//  Created by Connie Lim on 2/28/17.
//  Copyright © 2017 Connie Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSelection: UISegmentedControl!
   
    @IBOutlet var serviceButtons: [UIButton]! {
        didSet {
            serviceButtons.forEach {
                $0.layer.cornerRadius = 5
            }
        }
        
    }
    
    var tipPercentages = [0.10, 0.15, 0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func TipValueChange(_ sender: Any) {
        CalculateTip(Any.self)
    }
    
    @IBAction func dinningServiceSelected(_ sender: Any) {
        
        tipPercentages = [0.10, 0.18, 0.25]
        CalculateTip(Any.self)
    }
    
    @IBAction func transportationServiceSelected(_ sender: Any) {
        tipPercentages = [0.10, 0.12, 0.15]
        CalculateTip(Any.self)

    }
    
    @IBAction func groomingServiceSelected(_ sender: Any) {
        tipPercentages = [0, 0.15, 0.2]
        CalculateTip(Any.self)

    }
    
    @IBAction func beautyServiceSelected(_ sender: Any) {
        tipPercentages = [0.10, 0.15, 0.2]
        CalculateTip(Any.self)

    }
    
    @IBAction func CalculateTip(_ sender: Any) {

        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipSelection.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}


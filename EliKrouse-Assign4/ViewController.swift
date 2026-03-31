//
//  ViewController.swift
//  EliKrouse-Assign4
//
//  Created by Krouse, William E. on 3/25/26.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var billTotalTextField: UITextField!
    
    @IBOutlet weak var percentTipTextField: UITextField!
    
    @IBOutlet weak var peopleTextField: UITextField!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBOutlet weak var moneyPerPersonLabel: UILabel!
    
    @IBOutlet weak var generosityLabel: UILabel!
    
    
    @IBAction func tipSliderChanged(_ sender: Any)
    {
        
        percentTipTextField.text = String(format: "%.1f", tipSlider.value)
    }
    
    @IBAction func peopleStepperTapped(_ sender: Any)
    {
        peopleTextField.text = "\(Int(peopleStepper.value))"
    }
    
    
    
    @IBAction func calculate(_ sender: Any)
    {
        //calculation section
        guard let tip = percentTipTextField.text, let dTip: Double = Double(tip), let people = peopleTextField.text, let iPeople: Int = Int(people), let total = billTotalTextField.text, let dTotal: Double = Double(total) else
        {
            print("ERROR IN PERCENT_TIP , PEOPLE , OR BILL_TOTAL")
            showAlert("There was an Error in the calculation. Make sure you input a valid Bill Amount.")
            return
        }
        
        let split = BillSplit(tipPercent: dTip, bill: dTotal, people: iPeople)
        
        moneyPerPersonLabel.text = "$ " + String(format: "%.2f", split.calcPerPerson())
    }
    
    func showAlert(_ myMessage: String, _ title: String? = "Error")
    {
        let alert = UIAlertController(title: title, message: myMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func generosity()
    {
        generosityLabel.text = "Generosity 😊"
        
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        percentTipTextField.text = "\(Double(tipSlider.value))"
        peopleTextField.text = "\(Int(peopleStepper.value))"
        
        
    }
    
    class BillSplit
    {
        var tipPercent: Double
        var bill: Double
        var people: Int
        
        init(tipPercent: Double, bill: Double, people: Int)
        {
            self.tipPercent = tipPercent
            self.bill = bill
            self.people = people
        }
        func calcPerPerson() -> Double
        {
            return bill + (bill * (tipPercent/100)) / Double(people)
        }
    }
    


}


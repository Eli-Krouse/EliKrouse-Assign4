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
    
    @IBOutlet weak var aniPhoto: UIImageView!
    
    
    @IBAction func tipSliderChanged(_ sender: Any)
    {
        
        percentTipTextField.text = String(format: "%.1f", tipSlider.value)
        
        generosity()
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
        
        moneyPerPersonLabel.text = "$ " + String(format: "%.2f", split.amounts().2)
        
        animateMyCalc()
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
        let myGenerosityText = {(tip: Double) -> (String, UIColor) in
            switch(tip)
            {
                case 0..<10:
                return ("VERY LOW", .red)
                case 10..<20:
                return ("Low", .yellow)
                case 20..<30:
                return ("Average", .green)
                case 30..<40:
                return ("Great", .blue)
                case 40...100:
                return ("EXTREME", .magenta)
                default:
                return ("lame", .black)
            }
        }
        
        generosityLabel.text = "Generosity: " + myGenerosityText(Double(tipSlider.value)).0
        generosityLabel.textColor = myGenerosityText(Double(tipSlider.value)).1
        
    }
    
    func animateMyCalc()
    {
        UIView.animate(withDuration: 4.0)
        {
            self.aniPhoto.frame = CGRect(x: 275, y: 100, width: 86, height: 83)
            self.aniPhoto.alpha = 1
        }completion: { _ in print("done"); self.aniPhoto.alpha = 0; self.aniPhoto.frame = CGRect(x: 15, y: 650, width: 86, height: 83)}
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        percentTipTextField.text = "\(Double(tipSlider.value))"
        peopleTextField.text = "\(Int(peopleStepper.value))"
        aniPhoto.alpha = 0
        
        
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
        func amounts() -> (Double, Double, Double)
        {
            return ((bill * (tipPercent / 100)), (bill + (bill * (tipPercent / 100))), (bill + (bill * (tipPercent / 100))) / Double(people))
        }
        
    }
    

    


}


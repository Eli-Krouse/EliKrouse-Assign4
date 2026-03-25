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
    
    @IBAction func tipManual(_ sender: Any)
    {

    }
    
    @IBAction func peopleManual(_ sender: Any)
    {
        
    }
    
    
    @IBAction func calculate(_ sender: Any)
    {
        //calculation section
        guard let tip = percentTipTextField.text, let people = peopleTextField.text, let total = billTotalTextField.text else
        {
            print("VOID IN PERCENT_TIP , PEOPLE , OR BILL_TOTAL")
            return;
        }
        
        

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
        var people: Double
        
        init(tipPercent: Double, bill: Double, people: Double)
        {
            self.tipPercent = tipPercent
            self.bill = bill
            self.people = people
        }
        func calcPerPerson()
        {
            
        }
    }
    


}


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
        
    }
    
    @IBAction func peopleStepperTapped(_ sender: Any)
    {
        
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tipSlider.value = 20.0
        peopleStepper.value = 2
        
        
    }


}


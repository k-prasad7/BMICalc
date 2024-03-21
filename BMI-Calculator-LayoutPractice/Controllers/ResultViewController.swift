//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Kiran Prasad on 3/20/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiData: BMI?
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabelForBMI()
    }
    

    func updateLabelForBMI(){
        bmiLabel.text = String(format: "%.2f", bmiData?.value ?? 0.0)
        adviceLabel.text = bmiData?.advice
        backgroundImage.backgroundColor = bmiData?.color
    }

}

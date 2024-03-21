//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calcBrain = CalculatorBrain()
    @IBOutlet weak var weightText: UILabel!
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightText.text = String(format: "%.2fKg", sender.value)
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightText.text = String(format: "%.2fm", sender.value)
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        // Validate height & weight is greater than 0.1 meters
        if height > Constants.minHeight && weight > Constants.minWeight {
            calcBrain.calculateBMI(height: height, weight: weight)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        } else {
            // Display an alert to the user about invalid height
            let alert = UIAlertController(title: "Invalid Slider Value(s)", message: "Please adjust the both sliders to a value greater than 0.1", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiData = calcBrain.getBMI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


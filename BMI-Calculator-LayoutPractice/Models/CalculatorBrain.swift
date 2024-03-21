//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Kiran Prasad on 3/21/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain{
    var bmiData: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let advice: String
        let color: UIColor
        let height = (height * 100).rounded() / 100
        let weight = (weight * 100).rounded() / 100
        let bmiValue = weight / (height * height)
        print("height:\(height)")
        print("weight:\(weight)")
        print("bmiValue: \(String(describing: bmiValue))")
        switch bmiValue {
        case ..<18.5:
            advice = "You're lighter on the scale! Let's work on building strength and nourishment."
            color = UIColor.blue // Example color
        case 18.5..<25:
            advice = "You're in a healthy range! Keep up your balanced lifestyle."
            color = UIColor.green
        case 25..<30:
            advice = "You're a bit heavier on the scale. A few healthy adjustments can make a big difference!"
            color = UIColor.yellow
        case 30...:
            advice = "It's time to focus on your health. Small, positive changes lead to great achievements."
            color = UIColor.red
        default:
            advice = "Health is wealth! Wherever you are on your journey, small steps can lead to big improvements."
            color = UIColor.gray // Default color, in case it doesn't fit any category
        }
        bmiData = BMI(value: bmiValue, advice: advice, color: color)
    }
    
    func getBMI()-> BMI{
        return bmiData ?? BMI(value: 0.0, advice: "Error: BMI is 0.", color: UIColor.gray)
    }
}

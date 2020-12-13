//
//  SecondViewController.swift
//  ShchelochowDS_HW2.4
//
//  Created by Дмитрий on 12.12.2020.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var lights: UIStackView!
    var tapButton = 0
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lights.layer.cornerRadius = 10
        lights.backgroundColor = #colorLiteral(red: 0.1132152304, green: 0.1184720024, blue: 0.1147261038, alpha: 1)
        redLight.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.3)
        yellowLight.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 0.3)
        greenLight.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 0.3)
        startButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.height / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.height / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
    }

    @IBAction func startButton(_ sender: Any) {
        startButton.setTitle("Next", for: .normal)

        tapButton += 1

        switch tapButton {
        case 1:
            redLight.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            redLight.layer.shadowColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            redLight.layer.shadowRadius = 30
            redLight.layer.shadowOpacity = 5
            greenLight.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 0.3)
            greenLight.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        case 2:
            yellowLight.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
            yellowLight.layer.shadowColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
            yellowLight.layer.shadowRadius = 30
            yellowLight.layer.shadowOpacity = 5
            redLight.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.3)
            redLight.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        case 3:
            greenLight.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
            greenLight.layer.shadowColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
            greenLight.layer.shadowRadius = 30
            greenLight.layer.shadowOpacity = 5
            yellowLight.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 0.3)
            yellowLight.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            tapButton = 0
        default:
            print("Error")
        }
    }
}

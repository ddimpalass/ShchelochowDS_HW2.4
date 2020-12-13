//
//  LastViewController.swift
//  ShchelochowDS_HW2.4
//
//  Created by Дмитрий on 12.12.2020.
//

import UIKit

class LastViewController: UIViewController {
    @IBOutlet weak var viewRGBA: UIView!
    @IBOutlet weak var redLabelValue: UILabel!
    @IBOutlet weak var greenLabelValue: UILabel!
    @IBOutlet weak var blueLabelValue: UILabel!
    @IBOutlet weak var alphaLabelValue: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewRGBA.layer.cornerRadius = viewRGBA.frame.height / 2
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.value = 255
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.value = 45
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.value = 85
        
        alphaSlider.minimumValue = 0
        alphaSlider.maximumValue = 1
        alphaSlider.value = alphaSlider.maximumValue
        
        viewRGBA.backgroundColor = .systemPink
    }
    
    @IBAction func pinkTapped(_ sender: UIButton) {
        redSlider.value = 255
        greenSlider.value = 45
        blueSlider.value = 85
        alphaSlider.value = alphaSlider.maximumValue
        viewRGBA.backgroundColor = .systemPink
        redLabelValue.text = String(Int(redSlider.value))
        greenLabelValue.text = String(Int(greenSlider.value))
        blueLabelValue.text = String(Int(blueSlider.value))
        alphaLabelValue.text = String(Int(alphaSlider.value))
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        redLabelValue.text = String(Int(redSlider.value))
        greenLabelValue.text = String(Int(greenSlider.value))
        blueLabelValue.text = String(Int(blueSlider.value))
        alphaLabelValue.text = String(Int(alphaSlider.value))
        
        alphaSlider.tintColor = .init(white: 255/255, alpha: CGFloat(alphaSlider.value/1))
        
        viewRGBA.backgroundColor = UIColor(red: CGFloat(redSlider.value/255),
                                           green: CGFloat(greenSlider.value/255),
                                           blue: CGFloat(blueSlider.value/255),
                                           alpha: CGFloat(alphaSlider.value/1))
    }
}

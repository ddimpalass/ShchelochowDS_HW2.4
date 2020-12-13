//
//  MainViewController.swift
//  ShchelochowDS_HW2.4
//
//  Created by Apple on 11.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var login: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        printTime()
        
        guard let login = self.login else { return }
        userNameLabel.text = "Hello, \(login)"
    }
 
    @IBAction func logOutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "logOut", sender: nil)
    }
}

extension MainViewController {
    func printTime(){
        let myCalendar = Calendar(identifier: .gregorian)
        let currentDate = myCalendar.dateComponents([.day, .month, .year], from: Date())
        var newYear = myCalendar.dateComponents([.day, .month, .year], from: Date())
        newYear.day = 1
        newYear.month = 1
        newYear.year = 2021

        let daysPassed = myCalendar.dateComponents([.day], from: currentDate, to: newYear).day

        dateLabel.text = String(daysPassed ?? 0)
    }
}

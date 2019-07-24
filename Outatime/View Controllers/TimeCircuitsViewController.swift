//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Jake Connerly on 7/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    //
    //MARK: - IBOutlets and Properties
    //

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return formatter
    }
    
    var speedTimer: Timer?
    var currentSpeed: TimeInterval = 0.0
    var stopTime: TimeInterval = 88.0
    
    //
    // MARK: - View LifeCycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //
    // MARK: - IBActions and Methods
    //
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    func startTimer() {
        speedTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed(speedTimer:)), userInfo: nil, repeats: true)
    }
    
//    func resetTimer() {
//        timer?.invalidate()
//        timer = nil
//    }
//    
    @objc func updateSpeed(speedTimer: Timer) {
        if currentSpeed <= 5.0 {
            currentSpeed += 1.0
            speedLabel.text = "\(currentSpeed) MPH"
        }else {
            speedTimer.invalidate()
            
            destinationLabel.text = "--- -- ----"
            speedLabel.text = "0 MPH"
            currentSpeed = 0.0
            let alert = UIAlertController(title: "Time Travel Successful", message: "You're new dats is \(presentTimeLabel.text).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Great Scott!", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }

    
     
    //
    // MARK: - Navigation
    //
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
        #warning("Is this correct? ")
        datePickerVC.delegate = self
        
    }
    

}

//
//MARK: - Extensions
//

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(date: Date) {
        destinationLabel.text = dateFormatter.string(from: date)
    }
    
    
}

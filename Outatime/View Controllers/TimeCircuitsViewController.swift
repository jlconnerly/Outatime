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
    }
    
    func updateViews() {
        
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

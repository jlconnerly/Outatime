//
//  DatePickerViewController.swift
//  Outatime
//
//  Created by Jake Connerly on 7/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    //
    //MARK: - IBOutlets and Properties
    //

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    //
    //MARK: - View LifeCycle
    ///
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //
    //MARK:- IBActions and Methods
    //
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

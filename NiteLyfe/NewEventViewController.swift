//
//  NewEventViewController.swift
//  NiteLyfe
//
//  Created by Jonah Zukosky on 10/13/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {
    
    
    //Title Field
    @IBOutlet weak var titleField: UITextField!
    
    
    @IBAction func getTitle(_ sender: Any) {
        let title = titleField.text
    }
    
    
    //Date Fields
    @IBOutlet weak var startDateField: UITextField!
    @IBOutlet weak var endDateField: UITextField!
    
    let startPicker = UIDatePicker()
    let endPicker = UIDatePicker()
    
    
    
    
    
    
    @IBAction func submitButton(_ sender: UIBarButtonItem) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //createEndDatePicker()
        createStartDatePicker()
    }
    
    func createStartDatePicker(){
        //toolbar
        
        let startToolbar = UIToolbar()
        startToolbar.sizeToFit()
        let endToolbar = UIToolbar()
        endToolbar.sizeToFit()
        
        //button
        let startDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil,action: #selector(startDonePressed))
        startToolbar.setItems([startDone], animated: false)
        
        startDateField.inputAccessoryView = startToolbar
        startDateField.inputView = startPicker
        
        let endDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil,action: #selector(endDonePressed))
        endToolbar.setItems([endDone], animated: false)
        
        endDateField.inputAccessoryView = endToolbar
        endDateField.inputView = endPicker
    }
    
    func createEndDatePicker(){
        func createStartDatePicker(){
            //toolbar
            
            let endToolbar = UIToolbar()
            endToolbar.sizeToFit()
            
            //button
            let endDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil,action: #selector(endDonePressed))
            endToolbar.setItems([endDone], animated: false)
            
            endDateField.inputAccessoryView = endToolbar
            endDateField.inputView = endPicker
        }
    }
    
    @objc func startDonePressed(){
        //formatting
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium

        let startDateString = formatter.string(from: startPicker.date)
        startDateField.text = "\(startDateString)"
        self.view.endEditing(true)
    }
    
    @objc func endDonePressed(){
        //formatting
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium

        
        let endDateString = formatter.string(from: endPicker.date)
        endDateField.text = "\(endDateString)"
        self.view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

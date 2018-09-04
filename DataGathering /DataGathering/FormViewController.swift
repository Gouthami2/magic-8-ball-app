//
//  FormViewController.swift
//  DataGathering
//
//  Created by Rahul Mukherjee on 19/07/18.
//  Copyright © 2018 Mamostong. All rights reserved.
//

import UIKit

protocol FormViewDelegate {
    func formEntryCanceled()
    func formEntryCompletedWith(address: Address)
}

class FormViewController: ParentsViewController {

    @IBOutlet weak var lblHouseNo: UITextField!
    @IBOutlet weak var lblAddress1: UITextField!
    @IBOutlet weak var lblAddress2: UITextField!
    @IBOutlet weak var lblZip: UITextField!
    @IBOutlet weak var lblState: UITextField!
    @IBOutlet weak var lblCountry: UITextField!
    
    var delegate : FormViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func AddAddressClicked(_ sender: Any) {
//        if (!validate()){
//        return
//        }
        //create model and store in array
        guard let houseNo = lblHouseNo.text, !houseNo.isEmpty else {
            showAlert(fieldName: "House Number")
            return
        }
        guard let address1 = lblAddress1.text, !address1.isEmpty else {
            showAlert(fieldName: "Address 1 ")
            return
        }
        guard let address2 = lblAddress2.text, !address2.isEmpty else {
            showAlert(fieldName: "Address 2")
            return
        }
        guard let zip = Int(lblZip.text!) else{
            showAlert(fieldName: "Zip or invalid zip number you entered, Please enter the valid number")
            return
            
        }
        guard let state = lblState.text, !state.isEmpty else {
            showAlert(fieldName: "State")
            return
            
        }
        guard let country = lblCountry.text, !country.isEmpty  else {
            showAlert(fieldName: "Country")
            return
        }
        
      
        
        let addressModelObj = Address(houseNumber: houseNo, address1: address1, address2: address2, zip: zip, state: state, country: country)
        
        self.clearForm()
        
        //ToDo: Show an alert to the user that the data for house number xxxx is added
        let alert = UIAlertController(title: "Success", message: "yehh good job!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            if let delegate = self.delegate {
                delegate.formEntryCompletedWith(address: addressModelObj)
                self.navigationController?.popViewController(animated: true)
            }
        }) )
        self.present(alert, animated: true, completion: nil)
          
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.formEntryCanceled()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    fileprivate func showAlert(fieldName: String) {
        super.showAlertMessageWith(title: "Looks you missed something!", message: "why don't you fill the \(fieldName)")
    }
    
    
    
    func validate()->Bool{
       //ToDo - Write the code to validate and return true / false , if any text missing then show an alert
        if (lblHouseNo.text?.isEmpty)! {
            showAlert(fieldName: "House Number")
            return false
        } else if (lblAddress1.text?.isEmpty)! {
            showAlert(fieldName: "Address 1")
            return false
        } else if (lblAddress2.text?.isEmpty)! {
            showAlert(fieldName: "Address 2")
            return false
        } else if (lblZip.text?.isEmpty)! {
           showAlert(fieldName: "Zip")
            return false
        } else if (lblState.text?.isEmpty)! {
           showAlert(fieldName: "State")
            return false
        } else if (lblCountry.text?.isEmpty)! {
            showAlert(fieldName: "Country")
            return false
        } else if (lblCountry.text?.isEmpty)! {
            showAlert(fieldName: "Country")
            return false
        }
        
        return true
    }
    func clearForm() {
        self.lblHouseNo.text = "";
        self.lblAddress1.text = "";
        self.lblAddress2.text = "";
         self.lblZip.text = "";
         self.lblState.text = "";
         self.lblCountry.text = "";
    }
   
}
    


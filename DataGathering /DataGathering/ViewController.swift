//
//  ViewController.swift
//  DataGathering
//
//  Created by Rahul Mukherjee on 19/07/18.
//  Copyright © 2018 Mamostong. All rights reserved.
//

import UIKit

class ViewController: ParentsViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var addresses : [Address] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "AddFormSegue") {
            let formVC = segue.destination as! FormViewController
            formVC.delegate = self
        }
    }
    
    
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath)
        
        let addressModelObject = addresses[indexPath.row] 
        
        let lblHouseNumber = cell.viewWithTag(1) as! UILabel
        lblHouseNumber.text = addressModelObject.houseNumber
        
        let lblAddress1 = cell.viewWithTag(2) as! UILabel
        lblAddress1.text = addressModelObject.address1
        
        let lblAddress2 = cell.viewWithTag(3) as! UILabel
        lblAddress2.text = addressModelObject.address2
        
        let lblZip = cell.viewWithTag(4) as! UILabel
        lblZip.text = "\(addressModelObject.zip)"
        
        let lblStateCountry = cell.viewWithTag(5) as! UILabel
        lblStateCountry.text = "\(addressModelObject.state), \(addressModelObject.country)"
        
        cell.backgroundColor = UIColor.clear
        
        
        return cell
    }
}

extension ViewController: FormViewDelegate {
    func formEntryCanceled() {
        print("User cancelled Form Entry")
        DispatchQueue.main.async  {
            super.showAlertMessageWith(title: "User Cancel Entry", message: "Hey , u know u didn't entered any address.. Whhoooo")
        }
        
    }
    
    func formEntryCompletedWith(address: Address) {
        addresses.append(address)
        self.tableView.reloadData()
    }
    
}

//
//  ParentsViewController.swift
//  DataGathering
//
//  Created by Rahul Mukherjee on 23/07/18.
//  Copyright © 2018 Mamostong. All rights reserved.
//

import UIKit

class ParentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func  showAlertMessageWith(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("user clicked ok")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

}

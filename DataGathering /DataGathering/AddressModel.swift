//
//  File.swift
//  DataGathering
//
//  Created by Rahul Mukherjee on 19/07/18.
//  Copyright © 2018 Mamostong. All rights reserved.
//

import Foundation

struct Address {
    var houseNumber: String
    var address1: String
    var address2: String
    var zip: Int
    var state: String
    var country: String
    init(houseNumber: String, address1: String, address2: String, zip: Int, state: String, country: String) {
        self.houseNumber = houseNumber
        self.address1 = address1
        self.address2 = address2
        self.zip = zip
        self.state = state
        self.country = country
    }
}

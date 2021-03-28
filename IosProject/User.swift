//
//  User.swift
//  IosProject
//
//  Created by Sukhjeet and Suraj on 2021-03-10.
//

import Foundation
class User{
    var accountnumber:Int
    var password:String
    var firstName:String
    var lastName:String
    var accountType:String
    var acountBalance:Double
    
    
    init(accountnumber:Int, password:String, first:String, last:String, type: String, balance:Double){
        self.accountnumber = accountnumber
        self.password = password
        self.firstName = first
        self.lastName = last
        self.accountType = type
        self.acountBalance = balance
        
    }
}

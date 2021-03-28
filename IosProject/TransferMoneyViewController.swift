//
//  TransferMoneyViewController.swift
//  IosProject
//
//  Created by Suraaj Devgn on 25/03/21.
//

import UIKit

class TransferMoneyViewController: UIViewController {
    @IBOutlet weak var PayeeAccountLabel: UITextField!
    
    
    @IBOutlet weak var PayeeAccountTypeLabel: UITextField!
    
    
    @IBOutlet weak var AmountTransfer: UITextField!
    
    
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var remainingBalanceLabel: UILabel!
    
    
    
    @IBOutlet weak var clearText: UIButton!
    
    
    @IBAction func clearText(_ sender: Any) {
        
        PayeeAccountLabel.text = ""
        AmountTransfer.text = ""
        errorMessage.text = ""
        
        
        
    }
    
    
    
    var users = [User]()
    //var users3 = [User]()
    var remainingBalance = 0.0
    var amountToTransfer = 0.0
    var enteredAccountNumber = 0
    var fetchedAccountNumber = 0
    var getVerify = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayAccountDetails()
        
     //   let otherVC = LoginViewController()
      //  users3 = otherVC.users
       // print(users3)
        
        users.append(User(accountnumber:111111,password:"123456",first:"Suraj",last:"Devgan", type: "Current", balance: 500))
        users.append(User(accountnumber:222222, password: "112233", first: "Sukhjeet", last:"Singh", type: "Current", balance: 3200))
        users.append(User(accountnumber:333333, password: "654321", first: "Gracy", last: "Sai", type: "Savings", balance: 1000))

    }
    
    @IBAction func Transfer(_ sender: Any) {
        
        
        amountToTransfer = Double(AmountTransfer.text!) ?? 0.0
        
         getVerify = checkAccountNumber()
        print(getVerify)
        if getVerify == "Acount Found" {
            
            errorMessage.text = "Acount Found"
            
            if(remainingBalance>amountToTransfer)
            {
                remainingBalance = remainingBalance - amountToTransfer
                
                remainingBalanceLabel.text = String(remainingBalance)
                
            
        }
            
            else{
                
                errorMessage.text = "Insufficient Balance"
            }
            
        } else {
           
            errorMessage.text = "Acount Not Found"

        }
        
      
    
    }
    
    func checkAccountNumber() ->String
    {
        
        enteredAccountNumber = Int(PayeeAccountLabel.text!)!
        print(enteredAccountNumber)
        for usr in users {
        
            fetchedAccountNumber = usr.accountnumber
            
            print(fetchedAccountNumber)
            print("beforefetch")
            
            if(enteredAccountNumber == fetchedAccountNumber)
            {
                
                return "Acount Found"


            }
            

            
            
            }
        
  return "Account Not Found"
        
        

        
    }
        
    
    
    
    func DisplayAccountDetails() {
       
        for usr in users {
           
            print(usr.acountBalance)
     
                
               
            
            }
        
        print("sss")
         
        
        remainingBalanceLabel.text = String(remainingBalance)
        
    }
    
    
   
    

}

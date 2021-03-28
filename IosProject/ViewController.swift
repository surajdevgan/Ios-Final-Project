//
//  ViewController.swift
//  IosProject
//
//  Created by Sukhjeet and Suraj on 2021-03-10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var balance: UILabel!
    
    
    @IBOutlet weak var accountType: UILabel!
    var personName = ""
    var personbalance = 0.0
    var personaccountType = ""
    var users2 = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "Welcome "+String(personName)
        balance.text = String(personbalance)
        accountType.text = personaccountType
    
        // Do any additional setup after loading the view.
        let otherVC = LoginViewController()
      //  users3.append(User(accountnumber:111111,password:"123456",first:"Suraj",last:"Devgan", type: "Current", balance: 500))
        users2 = otherVC.users
        print(users2)
        for usn in users2
       {
        
            print(usn.firstName)
       }
        
       
    }
    
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as? PayBillsViewController
        let vcmt = segue.destination as? TransferMoneyViewController
       
        
        
        // Pass the selected object to the new view controller.
     //   vc?.personName = self.personName
        vc?.remainingBalance = self.personbalance
        vcmt?.remainingBalance = self.personbalance
       
    }


}


//
//  LoginViewController.swift
//  IosProject
//
//  Created by Sukhjeet and Suraj on 2021-03-10.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var captchaImage: UIImageView!
    @IBOutlet weak var errMsg: UILabel!
    @IBOutlet weak var usrName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    var users = [User]()
    var personName = ""
    var personBalance = 0.0
    var finalbalance = 0.0
    var personaccountType = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        
    }
    func fillData() {
        users.append(User(accountnumber:111111,password:"123456",first:"Suraj",last:"Devgan", type: "Current", balance: 500))
        users.append(User(accountnumber:222222, password: "112233", first: "Sukhjeet", last:"Singh", type: "Current", balance: 3200))
        users.append(User(accountnumber:333333, password: "654321", first: "Gracy", last: "Sai", type: "Savings", balance: 1000))
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as? ViewController
        
        
        // Pass the selected object to the new view controller.
        vc?.personName = self.personName
        vc?.personbalance = self.personBalance
        vc?.personaccountType = self.personaccountType
        vc?.users2 = users
        
      
    }
    

    
    //a function to verify if the username and password are correct it returns the person name
    //if the username or password invalid it returns inavlid
    func verifyLogin() -> String{
        let userN = Int(usrName.text!)!
        let pass = passWord.text
        for usr in users {
            finalbalance = usr.acountBalance
            personaccountType = usr.accountType
            
            if Int(usr.accountnumber) == userN && usr.password == pass {
            
                let name = usr.firstName + " " + usr.lastName
                return name
            }
            
           // return String(finalbalance)
        }
        return "invalid"
    }

    //this fucntion to check if should perfrome the segue or not upon the condition
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let getVerify = verifyLogin()
        if getVerify == "invalid" {
            return false
        } else {
            personName = getVerify
            personBalance = finalbalance
        
            return true
        }
    }
    
    
    
    @IBAction func reloadCaptcha(_ sender: Any) {
        
        let captchaArray = [#imageLiteral(resourceName: "captcha5"), #imageLiteral(resourceName: "captcha1"),#imageLiteral(resourceName: "captcha3"), #imageLiteral(resourceName: "captcha1"),#imageLiteral(resourceName: "captcha3")]
        
        captchaImage.image = captchaArray[Int.random(in: 0...4)]
        
    }
    
        
    @IBAction func moveToMain(_ sender: Any) {
        //check if shouldperfomrsege is true
        if shouldPerformSegue(withIdentifier: "login", sender: self) {
            performSegue(withIdentifier: "login", sender: self)
        } else {
            errMsg.text = "invalid username or password"
        }
        
    }
    
}

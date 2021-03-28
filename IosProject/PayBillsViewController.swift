import UIKit

class PayBillsViewController: UIViewController {
    
    @IBOutlet weak var remainingBalanceLabel: UILabel!
    
    
    @IBOutlet weak var electricityBill: UITextField!
    
    @IBOutlet weak var wifiBill: UITextField!
    
    
    @IBOutlet weak var errorMessage: UILabel!
    
    
    @IBOutlet weak var rent: UITextField!
    var users = [User]()
    var remainingBalance = 0.0
    var billtoPay = 0.0
    var wifibilltopay = 0.0
    var rentToPay = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        verifyTransaction()
    }
    
    
    
    @IBAction func ClearText(_ sender: Any) {
        
        rent.text = ""
        errorMessage.text = ""
        wifiBill.text = ""
        electricityBill.text = ""
        
        
        
    }
    
    
    @IBAction func PayBillButtonClick(_ sender: Any) {
        billtoPay = Double(electricityBill.text!) ?? 0.0
        wifibilltopay = Double(wifiBill.text!) ?? 0.0
        rentToPay = Double(rent.text!) ?? 0.0
        if(remainingBalance>billtoPay)
        {
            remainingBalance = remainingBalance - billtoPay
            
            remainingBalanceLabel.text = String(remainingBalance)
            
        }
        
         if(remainingBalance>wifibilltopay)
        {
            remainingBalance = remainingBalance - wifibilltopay
            
            remainingBalanceLabel.text = String(remainingBalance)
            
        }2
        
        if(remainingBalance>wifibilltopay)
       {
           remainingBalance = remainingBalance - rentToPay
           
           remainingBalanceLabel.text = String(remainingBalance)
           
       }
        
        else{
            
            errorMessage.text = "Insufficient Balance"
        }
    
        
    }
    
    
    
    func verifyTransaction() {
       
        for usr in users {
           
             remainingBalance = usr.acountBalance
            
            print(usr.acountBalance)
                
               
            
            
           
        }
        
        remainingBalanceLabel.text = String(remainingBalance)
        
    }
    

    

}

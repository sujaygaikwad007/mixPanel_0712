
import UIKit
import Mixpanel

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtLoginEmail: UITextField!
    
    @IBOutlet weak var txtLoginPass: UITextField!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        guard let email = txtLoginEmail.text, !email.isEmpty,
              let password = txtLoginPass.text, !password.isEmpty else {
                  print("Please Enter fields-----")
                  return
              }
        
        
        Mixpanel.mainInstance().track(event: "Login...", properties:
        ["Email" : email,
         "Password" : password
                                                         
        ])
        
        
        print("Login Button Tapped----------")
    }
    
    
    @IBAction func loginSignUpBtn(_ sender: UIButton) {
        
        let signVC = storyboard?.instantiateViewController(withIdentifier: "SignUp") as! SignUp
        self.navigationController?.pushViewController(signVC, animated: true)
    }
    

}


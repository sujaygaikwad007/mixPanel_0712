

import UIKit
import Mixpanel

class SignUp: UIViewController {
    
    
    @IBOutlet weak var txtSignUpName: UITextField!
    
    @IBOutlet weak var txtSignUpEmail: UITextField!
    
    @IBOutlet weak var txtSignUpPass: UITextField!
    
    @IBOutlet weak var txtSignUpConfirmPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func SignUpBtn(_ sender: UIButton) {
        
        guard let email = txtSignUpEmail.text, !email.isEmpty,
              let name = txtSignUpName.text, !name.isEmpty else {
                  print("Please Enter fields-----")
                  return
              }
        
        
        // add distinctid
        Mixpanel.mainInstance().identify(distinctId: name)
        
        // add people.set to set the user and show in user tab
        Mixpanel.mainInstance().people.set(properties: ["$email": email, "$name" : name])
        
        // track user registeration method
        Mixpanel.mainInstance().track(event: "Sign-Up...", properties:
        ["Email" : email,
         "Name" : name
                                                         
        ])
        
        print("Sign Up button click-----")

        
        
    }
    

}

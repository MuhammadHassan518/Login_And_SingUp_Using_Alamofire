//
//  ViewController.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnSinup: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    let api = API()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLoginClicked(_ sender: Any)
    {
        if txtEmail.text != "" && txtPassword.text != ""
        { self.ValidationCode() }
        else
        { self.Alert() }
    }
    
    @IBAction func btnSignUp(_ sender: Any)
    {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SinUpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
}
extension ViewController
{

    func ValidationCode()
    {
        if let email = txtEmail.text, let password = txtPassword.text
        {
                    if !email.validateEmailId()
                    {
                        openAlert(title: "Alert", message: "Email address not found.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                           /* print("Okay clicked!") */ }])
                    }
            
                     else if !password.validatePassword()
                     {
                        openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                            /*  print("Okay clicked!") */ }])
                     }
            
                    else
                    { Login() }
            
        }
        // empty textfields alert
                    else{
                    openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }])
                        }
    }// ValidationCode function end here
        
    func Alert (){
        openAlert(title: "Alert", message: "Please enter Email and password before press the login button", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }])
           }

   public func Login() {
           
       api.Login(vc: self, params: ["email": txtEmail.text!, "password": txtPassword.text!])
       { token in
        if !token.isEmpty
        {
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(HomeVC, animated: true)
        }
      }
    }
}


    
    
    
    
    



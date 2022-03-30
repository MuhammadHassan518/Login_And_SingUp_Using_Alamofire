//
//  ViewController.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSinup: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    let api = API()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnLoginClicked(_ sender: Any)
    {
        if txtEmail.text != "" && txtPassword.text != ""
        { self.textValidate() }
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

    func textValidate()
    {
        if let email = txtEmail.text, let password = txtPassword.text
        {
            if !email.validateEmailId()
            {
             openAlert(title: "Alert", message: "Email address not found.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }])
            }
            
            else if !password.validatePassword()
            {
            openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }])
            }
            
            else { Login() }
            
        }
        // empty textfields alert
        else{
        openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }]) }
    }// textvalidate function end here
        
    func Alert (){
        openAlert(title: "Alert", message: "Please enter Email and password before press the login button", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }])
           }

   public func Login() {
       api.Login(vc: self, params: ["email": txtEmail.text!, "password": txtPassword.text!, "firebase_token":"34235232"], url: "http://209.126.81.76/ducktindo_dev2/api/auth/login")
       { token,result  in
        if !token.isEmpty
        {
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            HomeVC.model = result
            self.navigationController?.pushViewController(HomeVC, animated: true)
        }
      }
    }
}


    
    
    
    
    



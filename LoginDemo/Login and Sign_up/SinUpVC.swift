//
//  SinUpVC.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import UIKit

class SinUpVC: UIViewController {

    let api = API()

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var lblRegisterButton: UIButton!
    @IBOutlet weak var txtpassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func btnRegister(_ sender: UIButton)
    {
        if txtemail.text != "" && txtpassword.text != "" && txtName.text != "" && txtMobileNumber.text != ""
        { self.textValidate() }
        else
        { self.Alert() }
    }
    

}
extension SinUpVC
{

    func textValidate()
    {
        if let email = txtemail.text, let password = txtpassword.text
        {
            if !email.validateEmailId()
            {
             openAlert(title: "Alert", message: "Please follow the email pattern Example: example@gmail.com.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }])
            }
            else if !password.validatePassword()
            {
            openAlert(title: "Alert", message: "Password must be greater than 8 character", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }])
            }
            
            else { SignUp() }
            
        }
        
        // empty textfields alert
        
        else{
        openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }]) }
    
    }// textvalidate function end here
        
    func Alert (){
        openAlert(title: "Alert", message: "Please fill the empty field before press the registeration button", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in }])
           }


   public func SignUp() {
           let param = ["email": txtemail.text!, "password": txtpassword.text!, "name": txtName.text ?? "", "password_confirmation":txtpassword.text!]
       let url = "http://209.126.81.76/ducktindo_dev2/api/auth/signup"
       api.Login(vc: self, params: param, url: url)
       { token,result  in
           if !token.isEmpty
           {
               let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
               HomeVC.userModel = result
               self.navigationController?.pushViewController(HomeVC, animated: true)
           }
       }
    }
}


    
    

//
//  APIManager.swift
//  LoginDemo
//
//  Created by Muhammad Hassan on 25/03/2022.
//

import Foundation
import Alamofire
import UIKit

public class API{
    
    public func Login(vc:UIViewController,params: [String : Any], completionhandler:((String) -> ())?) {

        AF.request("http://209.126.81.76/ducktindo_dev2/api/auth/login", method: .post,  parameters: params, encoding: JSONEncoding.default)
                                .responseJSON { response in
                                switch response.result {
                                case .success(let value):
                                    if let json = value as? [String: Any] {
                                    let newtoken = json["data"] as? [String:Any]
                                    print(newtoken?["access_token"] ?? "Token not found")
                                      
                                if newtoken != nil
                                {
                                    completionhandler?("\(String(describing: newtoken) )")
                                }

                            else
                            {
                                completionhandler?("")
                                print("fail in api")
                                let alert = UIAlertController(title: "Alert", message: "invalid Email_ID or password", preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                vc.present(alert, animated: true, completion: nil)
                            }
                                    
                        }
                        case .failure(_):
                        print("Invalid Email_ID or Password")
                       }
                    }
               }
}
